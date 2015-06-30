package edu.sjsu.cmpe275.project.controller;

import java.util.List;
import java.util.Random;

import javax.validation.Valid;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.sjsu.cmpe275.project.entity.CartEntity;
import edu.sjsu.cmpe275.project.entity.ReviewEntity;
import edu.sjsu.cmpe275.project.entity.ProductEntity;
import edu.sjsu.cmpe275.project.entity.UserEntity;
import edu.sjsu.cmpe275.project.service.CartManager;
import edu.sjsu.cmpe275.project.service.ReviewManager;
import edu.sjsu.cmpe275.project.service.LoginService;
import edu.sjsu.cmpe275.project.service.ProductManager;
import edu.sjsu.cmpe275.project.service.UserManager;

@Controller
public class ShoppingController {
	
	@Autowired
	private UserManager userManager;
	
	@Autowired
	private ProductManager productManager;
	
	@Autowired
	private CartManager cartManager;
	
	@Autowired
    public LoginService loginService;
	
	@Autowired
	private ReviewManager reviewManager;
    
	Random randomGenerator = new Random();

    public void setLoginService(LoginService loginService) {
            this.loginService = loginService;
    }
    
    public void setCartManager(CartManager cartManager) {
        this.cartManager = cartManager;
    }
    public void setReviewManager(ReviewManager reviewManager) {
        this.reviewManager = reviewManager;
    }
    
    @RequestMapping(value="/adminLogin", method=RequestMethod.GET)
	  public String Adminlogin(Model model) {          
	      //UserLogin user = new UserLogin();  
		System.out.println("in Adminsignin get........................");
	     // model.addAttribute("user", user);
	      return "adminLogin";
	  }
    
    @RequestMapping( value="/adminLogin", method = RequestMethod.POST)
    public String processAdminForm(HttpServletRequest request,HttpServletResponse response, UserEntity user, BindingResult result,
                    ModelMap model) {
		System.out.println("Hello vidya........................");
            
            if (result.hasErrors()) {
                    return "adminLogin";
            }
            
            List<UserEntity> userDetails = loginService.Adminlist(user.getEmail(), user.getPassword());
            
            if ((userDetails != null) && (userDetails.size() > 0)) {
            	UserEntity userList = userDetails.get(0);
            	
            	model.addAttribute("name", userList.getFirstname());
                    {
                    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
                    	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
                    	response.setDateHeader("Expires", 0); // Proxies.
                    	Cookie loginCookie = new Cookie("user",userList.getId()+":"+userList.getFirstname());
                    	
                    	loginCookie.setMaxAge(30*60);
                    	String s = loginCookie.getValue();
                    	response.addCookie(loginCookie);
                    	model.addAttribute("a",s);                     
                    }
                    model.addAttribute("results", productManager.getSellProducts());
                    return "adminHome";
                   /* return "redirect:adminHome.html";*/
            }else{
                    model.addAttribute("message","Email and Password doesn't match");
                    return "adminLogin";
            }

    }
	@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	public String addProducts(@ModelAttribute(value="product") ProductEntity product, BindingResult result) 
	{
		productManager.addProduct(product);
		return "Message";
	}

	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String listUsers(ModelMap map) 
	{
		map.addAttribute("user", new UserEntity());
		map.addAttribute("userList", userManager.getAllUsers());
		
		return "userList";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String displayLandingPage(ModelMap map) 
	{
		
		
		return "landingPage";
	}
	
	@RequestMapping(value = "/sell", method = RequestMethod.GET)
	public String addProducts(ModelMap map) 
	{
		map.addAttribute("product", new ProductEntity());
		map.addAttribute("product", productManager.getAllProducts());
		
		return "product";
	}

	
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addUser(@Valid @ModelAttribute(value="user") UserEntity user, BindingResult result, ModelMap model) 
	{
		if (result.hasErrors()) {
    		return "userList";
    	}
    	else {
    		
    	boolean userExists = userManager.checkDuplicate(user.getEmail());	
    		System.out.println("hereee" +userExists);
    	if(userExists){
    		model.addAttribute("message", "You are already registered");
    		return "userList";
    	}
		int x = randomGenerator.nextInt(999999);
		user.setId(x);
		userManager.addUser(user);

		return "redirect:signIn.html";
    	}
	}
	@RequestMapping(value="/signIn", method=RequestMethod.GET)
	  public String login(Model model) {          
	      //UserLogin user = new UserLogin();  
		System.out.println("in signin get........................");
	     // model.addAttribute("user", user);
	      return "signIn";
	  }
	
	@RequestMapping( value="/signIn", method = RequestMethod.POST)
    public String processForm(HttpServletRequest request,HttpServletResponse response, UserEntity user, BindingResult result,
                    ModelMap model) {
		System.out.println("In SignIn POST");
            
            if (result.hasErrors()) {
                    return "signIn";
            }
            
            List<UserEntity> userDetails = loginService.checkLogin(user.getEmail(), user.getPassword());
            
            if ((userDetails != null) && (userDetails.size() > 0)) {
            	UserEntity userList = userDetails.get(0);
            	
                    //model.put("signIn", user);
                    //model.put("name", userList.getFirstname());
                    model.addAttribute("name", userList.getFirstname());
                    
                    {
                    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
                    	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
                    	response.setDateHeader("Expires", 0); // Proxies.
                    	Cookie loginCookie = new Cookie("user",userList.getId()+":"+userList.getFirstname());
                    	//loginCookie.getValue().split(":");
                    	System.out.println("----------->"+userList.getId()+":"+userList.getFirstname());
                    		loginCookie.setMaxAge(30*60);
                    		String s = loginCookie.getValue();
                    		response.addCookie(loginCookie);
                    		model.addAttribute("a",s);                     
                    	}
                    model.addAttribute("results", productManager.getAllProducts());
                    //return "home";
                    return "redirect:home.html";
            }else{
                    model.addAttribute("message","Email and Password doesn't match");
                    return "signIn";
            }

    }
	
	@RequestMapping(value="/signout", method = RequestMethod.GET)
	public String userLogout(HttpServletRequest request,HttpServletResponse response)
	{
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0); // Proxies.
		
		Cookie cookie = null;
		   Cookie[] cookies = null;
		   // Get an array of Cookies associated with this domain
		   cookies = request.getCookies();
		   if( cookies != null ){
			   System.out.println("<h2> Found Cookies Name and Value</h2>");
		      for (int i = 0; i < cookies.length; i++){
		         cookie = cookies[i];
		        // if((cookie.getName( )).compareTo("user") == 0 ){
		            cookie.setMaxAge(0);
		            response.addCookie(cookie);
		           System.out.print("Deleted cookie: " + 
		            cookie.getName( ) + "<br/>");
		       //  }
		         System.out.print("Name : " + cookie.getName( ) + ",  ");
		         System.out.print("Value: " + cookie.getValue( )+" <br/>");
		      }
		  }else{
			  System.out.println(
		      "<h2>No cookies founds</h2>");
		  }

		
		return "signIn";
	}
	
	@RequestMapping(value = "/failure", method = RequestMethod.GET)
	public String showfailure(ModelMap map) 
	{
		/*map.addAttribute("product", new ProductEntity());
		map.addAttribute("home", productManager.getAllProducts());*/
		
		return "failure";
	}

	@RequestMapping("/delete/{userId}")
	public String deleteEmplyee(@PathVariable("userId") Integer userId)
	{
		userManager.deleteUser(userId);
		return "redirect:/";
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}
	
	public void setProductManager(ProductManager productManager) {
        this.productManager = productManager;
    }
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String showHome(ProductEntity product, ModelMap map) 
	{
		System.out.println("In home - GET");
		map.addAttribute("product", new ProductEntity());
		map.addAttribute("results", productManager.getAllProducts());
		
		return "home";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String showSearch(@ModelAttribute(value="product") ProductEntity product, BindingResult result ,ModelMap map) 
	{
		map.addAttribute("product", new ProductEntity());
		System.out.println("category" + product.getProductName());
		map.addAttribute("results", productManager.getSearchedProducts(product.getProductName()));
		return "home";
	}
	
	@RequestMapping(value = "/electronics", method = RequestMethod.GET)
	public String getElectronics(ProductEntity product, ModelMap map) 
	{
		map.addAttribute("product", new ProductEntity());
		map.addAttribute("results", productManager.getCategorizedProducts("electronics"));
       
		return "home";
	}

	@RequestMapping(value = "/clothes", method = RequestMethod.GET)
	public String getClothes(ProductEntity product, ModelMap map) 
	{
		map.addAttribute("product", new ProductEntity());
		map.addAttribute("results", productManager.getCategorizedProducts("clothes"));
       
		return "home";
	}
	
	@RequestMapping(value = "/automobiles", method = RequestMethod.GET)
	public String getAutomobiles(ProductEntity product, ModelMap map) 
	{
		map.addAttribute("product", new ProductEntity());
		map.addAttribute("results", productManager.getCategorizedProducts("automobiles"));
       
		return "home";
	}
	
	@RequestMapping(value = "/accessories", method = RequestMethod.GET)
	public String getMovies(ProductEntity product, ModelMap map) 
	{
		map.addAttribute("product", new ProductEntity());
		map.addAttribute("results", productManager.getCategorizedProducts("accessories"));
       
		return "home";
	}
	
	@RequestMapping(value = "/other", method = RequestMethod.GET)
	public String getOthers(ProductEntity product, ModelMap map) 
	{
		map.addAttribute("product", new ProductEntity());
		map.addAttribute("results", productManager.getCategorizedProducts("other"));
       
		return "home";
	}
	
	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public String getProduct(@PathVariable int id, ProductEntity product,ReviewEntity reviewEntity, ModelMap map) 
	{
		map.addAttribute("product", new ProductEntity());
		map.addAttribute("review", new ReviewEntity());
		map.addAttribute("results", productManager.getProductById(id));
		map.addAttribute("results1", reviewManager.getReviewById(id));
        
		return "product_display";
	}
	
	@RequestMapping(value = "/addtocart/{userId}/{productId}", method = RequestMethod.GET)
	public String addToCart(@PathVariable int userId, @PathVariable int productId, CartEntity cartEntity, ModelMap map) 
	{
		cartManager.addToCart( cartEntity, productId, userId);
		
		map.addAttribute("cart", new CartEntity());
		map.addAttribute("results", cartManager.getCartProducts(userId));
       
		return "cart";
	}
	@RequestMapping(value = "/addtoreview/{userId}/{productId}", method = RequestMethod.GET)
	public String addToReview(@PathVariable int userId, @PathVariable int productId, ReviewEntity reviewEntity, ModelMap map) 
	{
		//reviewManager.addToReview( ReviewEntity, productId, userId);
		
		map.addAttribute("review", new ReviewEntity());
		map.addAttribute("product", new ProductEntity());
		map.addAttribute("results", reviewManager.addToReview(reviewEntity, productId, userId));
       
		return "review";
	}
@RequestMapping(value = "/checkOut/{userId}", method = RequestMethod.POST)
	public String checkOut(@PathVariable int userId, CartEntity cartEntity, ModelMap map) 
	{
		int totalPrice=0;
		map.addAttribute("cart", new CartEntity());
		map.addAttribute("results", cartManager.getCartProducts(userId));
		
		List<CartEntity> list = cartManager.getCartProducts(userId);
		for(int i =0; i<list.size(); i++) {
			CartEntity product = list.get(i);
			totalPrice = totalPrice + product.getPrice();
		}
		map.addAttribute("totalPrice", totalPrice);           
		return "checkOut";
	}



	@RequestMapping(value = "/ReviewRate/{userId}/{productId}", method = RequestMethod.POST)
	public String ReviewRate(@PathVariable int userId,@PathVariable int productId, ReviewEntity reviewEntity, ModelMap map) 
	{
		
		map.addAttribute("review", new ReviewEntity());
		reviewManager.getReviewRate(reviewEntity, productId ,userId);
		
		map.addAttribute("product", new ProductEntity());
		map.addAttribute("review", new ReviewEntity());
		map.addAttribute("results", productManager.getProductById(productId));
		map.addAttribute("results1", reviewManager.getReviewById(productId));
		
		map.addAttribute("message", "Thank you for reviewing the product");
        
		return "product_display";
	}
	
	@RequestMapping(value = "/deleteProductFromCart/{userId}/{id}", method = RequestMethod.GET)
	public String deleteProductFromCart(@PathVariable int userId, @PathVariable int id, CartEntity cartEntity, ModelMap map) 
	{
		
		cartManager.deleteCartProduct(id);
		map.addAttribute("results", cartManager.getCartProducts(userId));
		return "cart";
	}
	
	@RequestMapping(value = "/toPay/{userId}", method = RequestMethod.GET)
	public String toPay(CartEntity cartEntity, ModelMap map, @PathVariable("userId") Integer userId) 
	{
		return "payment";
	}
	
	@RequestMapping(value = "/toPay/{userId}", method = RequestMethod.POST)
	public String PayementComplete(@ModelAttribute(value="cart") CartEntity cartEntity, ModelMap map,@PathVariable("userId") Integer userId,HttpServletRequest request,HttpServletResponse response) 
	{
		System.out.println("In payemnt");
		//HttpSession session = request.getSession(true);
		//System.out.println("------->"+userId);
		userManager.OrderHistory(userId);
		userManager.SendMessage(userId);
		return "redirect:/CompleteOrder.html";
	}
	
	@RequestMapping(value = "/orderHistory/{userId}", method = RequestMethod.GET)
	public String orderHistory(CartEntity cartEntity, ModelMap map, @PathVariable("userId") Integer userId) 
	{
		map.addAttribute("results", cartManager.getHistory(userId));
		return "history";
	}
	
	@RequestMapping(value = "/CompleteOrder", method = RequestMethod.GET)
	public String OrderComplete(ModelMap map) 
	{
		
		return "CompleteOrder";
	}
	
	@RequestMapping(value="/accountUpdate/{id}", method=RequestMethod.GET)
	  public String getUserDetails(Model model,@PathVariable("id") Integer id ,ModelMap map,HttpServletRequest request,HttpServletResponse response) {          
		//HttpSession session = request.getSession(true);
		
		map.addAttribute("user", new UserEntity());
		map.addAttribute("results", userManager.getUserById(id));
	      return "accountUpdate";
	  }
	/*@RequestMapping(value = "/failure", method = RequestMethod.GET)
	public String showfailure(ModelMap map) 
	{
		
		return "failure";
	}*/
	@RequestMapping(value="/accountUpdate/{userId}", method=RequestMethod.POST)
	  public String updateUser(@ModelAttribute(value="user") UserEntity user,@PathVariable("userId") Integer userId ,ModelMap map,HttpServletRequest request,HttpServletResponse response) {          
		HttpSession session = request.getSession(true);
		session.setAttribute("userId", userId);
		user.setId(userId);
		user.setFirstname(user.getFirstname());
		user.setLastname(user.getLastname());
		user.setEmail(user.getEmail());
		user.setPassword(user.getPassword());
		user.setAddress(user.getAddress());
		user.setCity(user.getCity());
		user.setZipcode(user.getZipcode());
		user.setState(user.getState());
		user.setPassword2(user.getPassword2());
		user.setPhoneno(user.getPhoneno());
		
		userManager.updateUser(user);
		
	      return "redirect:/updateSuccess.html";
	  }
	@RequestMapping(value = "/updateSuccess", method = RequestMethod.GET)
	public String updateSuccess(ModelMap map) 
	{
		
		return "updateSuccess";
	}
	@RequestMapping(value="/deleteAccount/{userId}", method=RequestMethod.GET)
	public String deleteMe(@ModelAttribute(value="user") UserEntity user, @PathVariable("userId") Integer id,ModelMap map,HttpServletRequest request,HttpServletResponse response)
	{
      //HttpSession session = request.getSession(true);
		
		map.addAttribute("user", new UserEntity());
		return "deleteUser";
	}
	@RequestMapping(value="/deleteAccount/{userId}", method=RequestMethod.POST)
	public String Unsubscribe(@ModelAttribute(value="user") UserEntity user,@PathVariable("userId") Integer userId ,ModelMap map,HttpServletRequest request,HttpServletResponse response)
	{
		//HttpSession session = request.getSession(true);
		
		userManager.deleteUser(userId);
		return "redirect:/Thankyou.html";
	}
	@RequestMapping(value = "/Thankyou", method = RequestMethod.GET)
	public String successfulUnsubscribe(ModelMap map) 
	{
		
		return "Thankyou";
	}
	
	@RequestMapping(value = "/ProductDisapproved/{id}", method = RequestMethod.GET)
	public String ProductDisapproved(@PathVariable int id, ProductEntity productEntity, ModelMap map) 
	{
		
		productManager.adminDisapproval(id);
		map.addAttribute("results", productManager.getSellProducts());
		return "adminHome";
	}
	
	@RequestMapping(value = "/productApprove/{id}", method = RequestMethod.GET)
	public String adminApproval(@PathVariable int id, ProductEntity product, ModelMap map,HttpServletRequest request,HttpServletResponse response) 
	{
		System.out.println("In find by update admin post ");
/*		HttpSession session = request.getSession(true);
		session.setAttribute("id", id);
		product.setProductId(id);
		product.setApproval("approved");*/
		System.out.println("In find by update "+product.getStatus());
		
		productManager.adminApproval(id);
		map.addAttribute("results", productManager.getSellProducts());
		return "adminHome";
	}
	
	@RequestMapping(value = "/productApproved", method = RequestMethod.GET)
	public String getadminApproval(/*@PathVariable int id, */ProductEntity productEntity, ModelMap map) 
	{
		
		/*productManager.adminApproval(id);*/
		map.addAttribute("results", productManager.getSellProducts());
		return "adminHome";
	}
	
	@RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
	public String getresetPassword(@ModelAttribute(value="user") UserEntity user,ModelMap map) 
	{
		
		return "resetPassword";
	}
	
	@RequestMapping(value="/resetPassword", method=RequestMethod.POST)
	  public String resetPassword(@ModelAttribute(value="user") UserEntity user,ModelMap model,HttpServletRequest request,HttpServletResponse response) {          
		System.out.println("In reset password post");
		HttpSession session = request.getSession(true);
		session.setAttribute("email", user.getEmail());
		
		String email = user.getEmail();
		String updated_password = user.getPassword();
		
		
		user.setEmail(user.getEmail());
		user.setPassword(user.getPassword());
		
		boolean userExists = userManager.checkDuplicate(user.getEmail());	
		
    	if(!userExists){
    		model.addAttribute("message", "Email not registered.");
    		return "resetPassword";
    	}
		
		userManager.updatePassword(email, updated_password);
		//userManager.updateUser(user);
		
		System.out.println("will redirect to signIn");
		
	      return "redirect:/signIn";
	  }
	
	
}

class Singleton:
	"""
	Singleton settings class controller
	
	This class allow for global shared variables across different modules
	
	A generic GET and SET function set allows for any type of variable to work
	as a global confined to a instance of this object.
	"""
	__instance = None
	__data = {}
	
	def getData(self):
		return self.__data
	
	def isset(self, key):
		if key in self.__data:
			return True
		
		return False
	
	def __init__(self):
		pass
	
	def __new__(cls, *args, **kwargs):
		if not cls.__instance:
			cls.__instance = super(Singleton, cls).__new__(cls, *args, **kwargs)
		return cls.__instance
	
	def __getattr__(self, key):
		try:
			return self.__data[key]
		except:
			return False
	
	def __getitem__(self, key):
		try:
			return self.__data[key]
		except:
			return False
	
	def __setattr__(self, key, value):
		# print 'setattr key: {} value: {}'.format(key, value)
		self.__data[key] = value
	
	def __setitem__(self, key, value):
		# print 'setitem key: {} value: {}'.format(key, value)
		self.__data[key] = value

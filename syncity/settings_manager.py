class Singleton:
	''' simple singleton for shared variables '''
	__instance = None
	__data = {}
	
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

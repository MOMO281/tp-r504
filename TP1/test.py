import pytest
import fonctions as f
def test_1 ( ) :
	assert f.puissance(2, 3) == 8
	assert f.puissance(2, 2) == 4
def test_2():
	assert f.puissance(2, -3) == 0.125
	assert f.puissance(-2, 2) == 4
	assert f.puissance(0.5, 3) == 0.125
	assert f.puissance(1, -1) == 1
	assert f.puissance(-1, 1) == -1
	assert f.puissance(-1, -1) == -1

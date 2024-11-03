Return-Path: <linux-mips+bounces-6623-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7C69BA586
	for <lists+linux-mips@lfdr.de>; Sun,  3 Nov 2024 14:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9A95B21760
	for <lists+linux-mips@lfdr.de>; Sun,  3 Nov 2024 13:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4674D8C8;
	Sun,  3 Nov 2024 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="jqDWBJe/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16346175D37;
	Sun,  3 Nov 2024 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730639060; cv=none; b=D08DXNO+1Ahj9rVinjLRVo/GClRSc2EcGWxc+I94VvB5bkm8h7mpPE5O3oEeSaJeN8QPfCTPbXRvIuE7tKXaNd1T5EJRuqqDQbqOEAOzmDBxrKK5HxsA3MJI/IMYUq5WcPUUsBhosNxnx8Z7+Ot+Tf6HPH9yGu5+zXuhQCjDHRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730639060; c=relaxed/simple;
	bh=sMajPi2Q7jQgrlRJ760ebRnaLlA1VcSfXoRwLl40qZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+oECq5dbl81xgjDdte8Hkcu9OUm7QvHJfG6jjJ/rPzIRrFfJIUjOqBl9ni8KxoIxqZEYvzthXSBgv5EAgJ2nkT3hV+j7q3s9XyTVR37w0mFzvd9gLJrHKpE0zvP7EkOdPTVZM6sQwJMgis60RlQ034fGLnsLdc1TLPvdwHj9m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=jqDWBJe/; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1730638906;
	bh=1qs2YNwrRDZd4pch8nMQXHdJPqYYqE9eYDk77el7hbs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jqDWBJe/dxPxXYdHD5AElj3kn7YFCRBKCPkyb8+JwNdwMXL4xXII9Jct3XxOnnA0u
	 IVLFDp0JH5a5l3HXGxeJpvAklgRIng0LH733B50Es76TF8YpT+v0dnLwUAkF8fda5I
	 5VZGLBL5+3moaHbQU52pdtcynmrEfZD0oaNU59fc=
X-QQ-mid: bizesmtpip4t1730638850tns42c7
X-QQ-Originating-IP: KRc8glwjaLwZLZu8e37iGraP3Gm377rGjMkOL4iqbXQ=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 03 Nov 2024 21:00:47 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6984051475002243690
From: WangYuli <wangyuli@uniontech.com>
To: tsbogend@alpha.franken.de,
	wangyuli@uniontech.com,
	dhowells@redhat.com,
	jlayton@kernel.org
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	xuerpeng@uniontech.com,
	maqianga@uniontech.com,
	baimingcong@uniontech.com
Subject: [PATCH 0/2] MIPS: loongson3_defconfig: Enable blk_dev_nvme by default
Date: Sun,  3 Nov 2024 21:00:03 +0800
Message-ID: <324362BC443F16F8+cover.1730638429.git.wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OfdzfOk+3eWlSkDEdcSZKNtYkMhlTCIDfGzaBDTUIn4oK8VUAhMFp0Nb
	FSAbMGlCbOmCe1Sk0boFOO8rJQ9G49ie//5VaW6PkQMvrmR8yQ9PNLXplTyYzinf2CBE+Xm
	F/ajzMof9FZ9yLP4yD3A4pFYDvCgfZIGu/cYd1Uk2BqvThvapS5yZ4XdKf3uHecN4KlKeg1
	5gxeWQ1Wke4CdyULshlCUP5Z32KLBzNnxGCqJpxNoC7L/QhZeHm0iotsaciPJ+ixW9EnSQJ
	nszYX+JrLpetqRnlCWKlkXRuTsirO9m8viOxypE3heEg+RdasrJATOrHyEeEdQfGbb1lUeJ
	15pbe5CMOvDcVQ/jw0Q00MATqclblxyHai1Ls5xRsxWIP284mghw/WrLBPL7g4Nbme9xAzi
	b7WMy61jZM8hTj/co1CxTJSNrPrAkjuDY+PECMFhy8XtoZhQ7IfsSUOzN/vTQIyJPJ7aaHa
	76FyYNlVS0Fg8mOER9qbZLFZT5W5tMsirDXsI9X1HO541Mu0dbCeqfuHPsXISKfNfXS6yi6
	l9aOvgy5GG0hF1DPVOWJkPAfFSXwUBCkhE3RJnGojWaXAdObthqby1lOcd5y8hThFoHDEZf
	5HhqKTarOhr5bpic8cFtauwzxo5TkTtsRiXr8iB46v6vFfWI4wH3G/6ASlA5zcHI7ZH0rRL
	iv8WyFoSTSyw3RcWarqpYFCD++CA/YfYmrYqMqg3DfTdj75M2NvuX7YAdHdfXPTalrAq+hU
	+L0TrGofsxXKCEi1kGWqNDn6kBZnpJ/efOA6lI1ldWzBq//CjK3QPxsFfl2zzEELAWW6DqE
	R+Nxjc9mQ6DfKyc+puFVp5tsspIFXZERi0FhHZHPrpL2n9rCUTS+wOaLy+/fC2/1WAD3gE0
	HPVaniBnO0rOiC5MQPFnyu/iq7Zofo8+1xXKZ/eXuV7kehG4TPsbQRQgNdlYZwuY0yRX5bg
	dpXjx64LzlGfGYi4BnNmdF9nMz3T76CECHikd7MdLKKPy+WsGPaSuhr91F7RBsMTBlhz4CU
	iwwEByF6zUyXtXrZ1HHsYPzzYvgdNFY7Fd1/aHt0h5CVe/nLnh8mdd8eEylnbstKpqyJt2H
	g==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

A significant number of 3A4000 machines come with NVMe drives
pre-installed, so we should support it in its defconfig.

To avoid confusion, update defconfig beforehand.

WangYuli (2):
  MIPS: loongson3_defconfig: Update configs dependencies
  MIPS: loongson3_defconfig: Enable blk_dev_nvme by default

 arch/mips/configs/loongson3_defconfig | 32 ++++++++-------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

-- 
2.45.2



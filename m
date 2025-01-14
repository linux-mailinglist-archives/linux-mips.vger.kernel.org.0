Return-Path: <linux-mips+bounces-7443-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D29C2A10F98
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 19:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61F19188C105
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 18:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EC020766C;
	Tue, 14 Jan 2025 18:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="IONLLsLS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wAoc+aSO"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5292063DF;
	Tue, 14 Jan 2025 18:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736878326; cv=none; b=FBdyjLlBxQY2eabq2kOXisyq+O7qoNdNNt4q8SfTNRPuNT0xeBcqtbLOiU6mJIHQ7dRzxre7SJavNG69C4xFj0mQ8NRioZSqwp8rd8GfiAzaZXIKbOug6Tyun1MPmbUfkouREZl2oqRq09pyxeBmCFET6JhMOO3r9/+epr+AEBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736878326; c=relaxed/simple;
	bh=W2IvFO1oA5Iqc5+taulUn14dOEs6txDAF0rN8lo4VU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C3u7vldPYy/46c9E9yOoEFJyI+knM2hcND3hhZx58XfQrK0kOGXUYt+aKEBrArcqDlrIJY2PHzASkocbAK0ArrxFK8bgvzFb+dGIBj55uCLYMiEH/5s2vOCdx+trS1EVIL7jrwalSw2HPZNekvB93GO7H5veldNob7cFz7yphXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=IONLLsLS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wAoc+aSO; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id B62D21380235;
	Tue, 14 Jan 2025 13:12:03 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jan 2025 13:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1736878323; x=1736964723; bh=37
	VfeONMGNgvwpF+tYFFmlQ8RXizDbaN+s6iQMuubGI=; b=IONLLsLSvee8PE/A6R
	SZGL9FH47LgBPia2eGtfwn/IuDamNOniuwj0i0gzjn+T6BJqhb+pUiSnqnSYbbPI
	uM7Ivq+VDtLKZ0cprFadh0XZ8jRdac+074yl31KIcKkr+oH+kFl4R2nZpgW3ioDn
	adzrbFocsfRrJt9xKPsmVmFdowmsyF07iHWJNRGUFvrGfLtd5+bFjTWmt+stV+Fl
	CU4A5XIdJrluwWDFv4yERSLw/aBT+MwgDijZIvZucTCv56NA4Fmnf2nG0p/tDpb2
	puwrMMgup1otY13SJnY29jMJlYR9Q/fzkd4gwv8mySmbD7RTfkhmfLponFRbqQQe
	iqNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736878323; x=1736964723; bh=37VfeONMGNgvwpF+tYFFmlQ8RXiz
	DbaN+s6iQMuubGI=; b=wAoc+aSOYDBuMx0EPVI4g+J1tPAsoOl1poP/inZt1J/J
	K8HP4KF/NV65myBsvdPfWo6/HE1Vbc0voPtHNGeLfBPTOsYY4sgmKrt7tXeXRVRO
	LTiigc7Mux29BdXtclZlshBI3GIYOMg9949LFEjhNCUkPy91pEN+SB2PlOX2am50
	s+Jz2EQ6ffA/lSIq7XSKg5f9Dht03zJ0j/BGtqAjYpbprLzIzL4w8jHZMKgwiwvD
	NOvE9TcdAB2g4kh8ZPWge0kqfC7HX2/VjnYtZYdQ32qEFFUgcg73KwbKUU856VMY
	MY4PvU8K9Mt8PAudDPL1zcowPENLClCFOGzp2bcGKQ==
X-ME-Sender: <xms:86iGZ2AEqprmGAKo4_Bv8PWl9Db7TjDOKzDAvx2dKPniqG8MS8zSag>
    <xme:86iGZwg5yCpMjlVRtwyynb6OB0-wrJM_2lvpnqkYTye9CTMJ1QBcTunCgOWCuCuI4
    2C41QT1glB7qsVXh_A>
X-ME-Received: <xmr:86iGZ5nQPZXqksmZjwDY8HU5Djlj35Mu3yYeFvm55oaELz7mbl2T1Uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeen
    ucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhmqeenucggtffrrghtthgvrhhnpeekhfeuffdukefhledvffeijeehgedt
    ueeiffevleekvefhveevtdekfefhgedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhi
    rgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtohepkedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrthdrjhhonhgtiiihkhesohdvrdhp
    lhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheplhhinhhugi
    dqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtrggslh
    gvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhssghoghgvnhgusegr
    lhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopegshhgvsehrvgguhhgrthdrtg
    homhdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:86iGZ0yzqlSkW-x05ZSzsT37mqGXrtfifxH61nPr27193t9vnJC-MA>
    <xmx:86iGZ7RjGNixexGRkY4gp-dvhzD-F_7lSHzcrB4SxjQNHH5ZC0doTQ>
    <xmx:86iGZ_bHzG69uUaFyaknUknD8C8oiTlIkOXLu5s5myFI6mbw_3K_zw>
    <xmx:86iGZ0S5PUYjE0f6crooUaw5KLVyf4hHnPaMgGX3Ion6HjndCs9Gzw>
    <xmx:86iGZ2ERVn3H1_nx6NFWjJcK4j6bgRu83N87i0pptH7G7dybuqjQv_xg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 13:12:02 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 14 Jan 2025 18:11:58 +0000
Subject: [PATCH] MIPS: pci-legacy: Override pci_address_to_pio
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAO2ohmcC/x3LQQqAIBBA0avIrBtopMC6SrTQGmugNDQiiO6et
 Hx8/gOZk3CGXj2Q+JIsMRRQpWBabVgYZS4GXeu2Jmpwt9tpUSJ6uTmjaZkaR67zxkGZjsR/KM8
 wvu8HOMkAXWAAAAA=
X-Change-ID: 20250114-malta-io-fixes-85e14b1b9f8b
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=W2IvFO1oA5Iqc5+taulUn14dOEs6txDAF0rN8lo4VU4=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhvS2FZ+/Jbz5a7G1W/KJ39veVzdZrq+7fq5rvwXHn/K0W
 xZXqnlkOkpZGMS4GGTFFFlCBJT6NjReXHD9QdYfmDmsTCBDGLg4BWAiPjmMDCcbHza/PNW1blf+
 Vss834qwcNUWDr1lATeC+hfN4HvVrMXI8G3pn0XyQRGNW/7sfdn16V/2hNAjjerVk//G8zppzvn
 3lw8A
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

pci-legacy systems are not using logic_pio to managed PIO
allocations, thus the generic pci_address_to_pio won't work
when PCI_IOBASE is defined.

Override the function to use architecture implementation to
fix the problem.

Cc: stable@vger.kernel.org
Fixes: 4bfb53e7d317 ("mips: add <asm-generic/io.h> including")
Reported-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Closes: https://lore.kernel.org/r/99f75c66-4c2d-45dc-a808-b5ba440c7551@app.fastmail.com/
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
This is a quick fix for fixes tree and stable backporting.
In long term, we should get logic_pio accept fixed mapping,
and make PCI core code aware of platforms not using vmap
for PCI_IOBASE.
---
 arch/mips/pci/pci-legacy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
index ec2567f8efd83bff7b106cbbd9ec7a6de0308c4c..66898fd182dc1fec1d1e9ae4c908873d59777182 100644
--- a/arch/mips/pci/pci-legacy.c
+++ b/arch/mips/pci/pci-legacy.c
@@ -29,6 +29,14 @@ static LIST_HEAD(controllers);
 
 static int pci_initialized;
 
+unsigned long pci_address_to_pio(phys_addr_t address)
+{
+	if (address > IO_SPACE_LIMIT)
+		return (unsigned long)-1;
+
+	return (unsigned long) address;
+}
+
 /*
  * We need to avoid collisions with `mirrored' VGA ports
  * and other strange ISA hardware, so we always want the

---
base-commit: dab2734f8e9ecba609d66d1dd087a392a7774c04
change-id: 20250114-malta-io-fixes-85e14b1b9f8b

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>



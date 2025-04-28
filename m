Return-Path: <linux-mips+bounces-8823-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F06A9E6CD
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 05:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D452618983CA
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 03:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D776B15E5D4;
	Mon, 28 Apr 2025 03:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="LZr+khGn"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FF88BE7;
	Mon, 28 Apr 2025 03:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745812194; cv=none; b=FX1UQ4Mwl+MCrcyrLO+OKtcoFkctt3Q/fU064zWSDDCfkGVAuKUdRoYZ/8gCjeSF8YgBg/NkfBLf6rbze6TYYRCdFavm5FMTdjg8ye/vvKI3R79uxP6aXwuEGE8l96UGDDhLbJ7sAuv63DQDeJProFf1tA2uV95LLGyeAq7pmJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745812194; c=relaxed/simple;
	bh=mrO0sX0AxY9NPTt5ghapA/2o2ZwZKknZIzyQtCGodvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PMpQz290WxivoCGv6Nm5KKYDh6TnN9miMJ/MipgOhV1awrSPvNMb63d6vQe7JQTraLdgoT9nHkxm+jBt3Fnin0vakVyQ+IcVA0pPqbw9ygi4Cxi3KAEERqT/xSCYH7CVBIfvMNsIcLZHj3T9gEuSA/aQBf1U1Ojv4HMiCfY6XaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=LZr+khGn; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745812077;
	bh=WpqtUOShDe+d+QdRjkjQdxIWTys7H+1vGp8ynPDL/AA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=LZr+khGnAsDtOmUyNE/plJXf2CzyLZFjwIdMpZD+peotR2fkypqVswzOwgezFZqEu
	 IWDRF3TfgmjrGpRrFwh4E7xsrDdSfbyKR7HxcQ70hTRVjH+OOuzNDmxSy1Gl/BCsxb
	 baS3l3O5pi14NPBYWE+AIdxPJbRQ3oqZ79J0x6A0=
X-QQ-mid: zesmtpip4t1745812071t19a885c9
X-QQ-Originating-IP: uJ10WdG01LcOglQJft41t6kJrx/BDcIqge5YsKhZL08=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 28 Apr 2025 11:47:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12876822068157501382
EX-QQ-RecipientCnt: 18
From: WangYuli <wangyuli@uniontech.com>
To: corbet@lwn.net,
	akpm@linux-foundation.org,
	rostedt@goodmis.org,
	paulmck@kernel.org,
	thuth@redhat.com,
	bp@alien8.de,
	ardb@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] Documentation/kernel-parameters: Update memtest parameter
Date: Mon, 28 Apr 2025 11:47:46 +0800
Message-ID: <0FC3D21CA22E8251+20250428034746.21216-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OKhYnE1LzMsBtjCzMViUZz0vShMOafMo/wwHrFr3pnfFyZQ2GYCXBhSl
	Y6mfhvDvDR6ycyjTdKbPdKfkljVVe7AR2UHT74JnPheoOa0+9ChFqlFibayT9HdjIYDz4s3
	CeUrK599sJw5SjGYcCtE6uqAbyqpph87oQZJq/Tor62BF0WQ00iWyu22pZaAicV2H3lp2vt
	7LqCsi7YOxT5aAQKnz4MsxF1GT7TUM3vmM7dEzj/+HAeklTJbCByU3BdmOhPQkPwVuQHVY4
	aCXeIR3j8BaycFTh+bEW6lXwY4JUDki0ntaZyvp7XmkaUaj1rO7u2+HXaS9+umGYx6YqFua
	kW/Zm7zEYqgX84Nzbb2EdNxaCo9qg2HzarPrCARLfOFR0A8k8s5nbc8FycyhCBlQ6XW2gML
	0n6EZ1yDgBTXBCNl/lQZJr8abTae7LMEeOt7Y9MgCA5mRch5HGPR8g6o+UV0fK1BYQIKr2K
	HDrRG2W3jw68VTj4SFKUEZfTGDRdHDKDBOy+s8+g9K+feMZiZCRddRkEafrC/GUcDVXzlt7
	B4Wf8nYgHwgFq3wK42kjQ+2hwajs6L1X8S9tAT+gZow827lGT+/8yFQgvIlW2VGFqwmNfKh
	ChxW2ktXyqlrQYQRmZ2GetQpYFo4Q4lRrJPf4Eas3dAZpdKcSuiZqQLqRUNmew3kTsMA1du
	MQTXKUkmhn857pWKRlzVLe6rps/W6Mz6ScIGl3HgnOB+OsoJ9H3vndqnZA/YNFf7m0aHmGy
	cnpWrmYuYM/nUcoMvpzPQ51PhRV0PsXxfII2dDZJO0XEfV+PIYC4GW1YjFqA9OMORf5x/+c
	XaN2a0hVfso7tbv0oEkdY3athI7J4AOFKQ/bBX/Od8rvfClSQAyBa2fsztEB4gTrdDxOEB8
	ea5FHwjFU8idmptCI782LHs4vm8B8u+LyQOW7TJ7dzo40zishBVLEeEu6babMrBvE5/0J25
	j6fyhaQ13vXP2N5AdYQ9qtGzhFhqqm7xzaNNKPCwjZKQ3Tm5Urkr/LvPp+/pDVPxYgn0=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

LoongArch, MIPS and XTENSA has supported memtest now.
Update documentation for them.

Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dce44566192ec0b38597fdfd435013c2d54653ff
Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fb8e9f59d6f292c3d9fea6c155c22ea5fc3053ab
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d9fd26b95b34..eeba55deb38d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3620,7 +3620,7 @@
 			Note that even when enabled, there are a few cases where
 			the feature is not effective.
 
-	memtest=	[KNL,X86,ARM,M68K,PPC,RISCV,EARLY] Enable memtest
+	memtest=	[KNL,X86,ARM,LOONGARCH,MIPS,M68K,PPC,RISCV,XTENSA,EARLY] Enable memtest
 			Format: <integer>
 			default : 0 <disable>
 			Specifies the number of memtest passes to be
-- 
2.49.0



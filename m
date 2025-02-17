Return-Path: <linux-mips+bounces-7795-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA75A3865A
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2025 15:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 567E17A3069
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2025 14:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B353021CC5C;
	Mon, 17 Feb 2025 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="j8rkKC9x"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32C821B1BC;
	Mon, 17 Feb 2025 14:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802590; cv=none; b=MAtXva0FYxapptScZg1JV3ZFUl2ujG7J5YIVNhIptpoDvl8n3V0T05q3JQt+i8RexvVp5/ffyAejyiGhqF+uJ2GgscyutpdjW39L+LrhDpZoc/jM+AL2cse0Oe9h/vXvo39fNGMPA/FuixJWthHGnDpW/bbparT8fGxJPt5jPNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802590; c=relaxed/simple;
	bh=O++yBq3XyAqa+qJzl/qmVIimVxIt9ejBcHQx6tKw0CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YYLQHRCm3oKMnfRdxX2cdp9pDFgYbmdIrulEcnOI6tBfRC2/yJnQ+7hjpuSTszusfQv6bY07CnwYTNuTaS0TOu9oriquENTPxnSOc0WMPK3a5PVoP/jgeyCWv/WjRkiqu4wmAp2ZRhSL2dJ6Q5gSKQNHcROGb/vPYw5YDQr70wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=j8rkKC9x; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739802551;
	bh=5x13ILjKbZvnJDQ7oramjw2SJGmPYZ+Zd80ZaIfxWcY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=j8rkKC9x8GZa1TeTHyegzwnZTjcASUb30UO4EcNFSRVGRwAVJSGQZNE2pVMtn5WIo
	 DdrLb5/8DoW0Z3ZhOKGQXd/wje2jmexreZDcsJTeEywy2COBXwx5gcBcoa6+tacvzt
	 bAu1iiorfvX/DeHlrlLtccERefYGUFCL/Mru204E=
X-QQ-mid: bizesmtpip2t1739802540tspjgaf
X-QQ-Originating-IP: WOK1g5x7S35CU0oDn6xnBn3c6ds7Y9bSRJSl+maPMWg=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 17 Feb 2025 22:28:58 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7336593324735201871
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: chenlinxuan@uniontech.com,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	masahiroy@kernel.org,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com
Subject: [PATCH v3 1/2] MIPS: dec: Only check -msym32 when need compiler
Date: Mon, 17 Feb 2025 22:28:56 +0800
Message-ID: <69EBF163CEC09696+20250217142857.49414-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <8ABBF323414AEF93+20250217142541.48149-1-wangyuli@uniontech.com>
References: <8ABBF323414AEF93+20250217142541.48149-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MLdygLUfuE5JhtQmmWqZlvS0BSzx/t30FXCLOOLYAy2i9o20mF6ZHo9j
	qLEUeTlGD+jv9PtJl/roYdlNpqtpod/vxUM38uIgXH0bEeZythuuG1ZT9dfOHN9Z5pJfBJj
	ZMN5PtuANIRgvumpztLu3CfenK52JELdZz2lH7hlwWFeknwtKSt8Wk48Inu/frch/PAfQ1g
	F2XfZHKMFAI2aGLFLOtXY11I9S9SZT6F7f5PJu6LoX3iY/JE7El1WhuCdH877kmduRdiXyJ
	XfyJQrmy4KSD3JladBzCyI0MUb7ZdPLWEmB3PmmcEVDOML4gQfrhUBO7DALYBvd5gDg4Uwr
	bKF5jfbAu/H32hwrm4+244a6uoX+CzEwKQPLCwVahG6rKTFEXgIeQqwlwZuWwLWJ7q6spEr
	4bMhTEOe9mhoZWmhqiRwl3OqrPNa2yaTZm/YUd/cuew74/hWU5ez677AKngM2/uj5AGRUwA
	B/6EuZrcynmwRtwo7owQeBMFGAhd7Dh/SkDqfpm/16TqOVwDSERvT54B2Y+eBsyN8RbV+X3
	6HDXIng+WO8YGMwlWyloR2QYyZFogB8lbuq3MYIKxtGfGTDa7vtay4iPL7Vf+IEaOfdPMQj
	3zF7krCTKuRJvZpuW7LjIO4vL/KQrTcqkXSEWoD9DR+Fl4WmP9Vlj1h+k2/1I2hFs6PUguR
	Hd5iJWdU4IzXZuZj+Q5/kpemsOHQupi4XAIe8Jbfjn0a/yhWuqlbA/YZB+dMcuEWd3zodvc
	/XYkgJi3En0u2vcQA/4fJ6rTKjfLZn2/1I4HwoiJz38ZPXBly9mts3eSDD8epuvF4yhxbqs
	vyR3FAiLlVFuy+JSfmm72EC3tx8P9oJVKHuhrjLqJvVRDeKU0ediJnIqot5qGjqVrejzYTm
	RFBmt77BQc91Qcg36Nq0l+PbEL9cGOtsTIDBgxgmDtY3zufiZnTPiGSI7ZEAJxYc8tIn5ss
	alPIAKwZqs7JADWH5pXjoT7gvT6pG0P90BfBL/RN/41nWei7N5zEMvewsmV3uZVdzOuMEtP
	h5YHi9V9EufqfgnYDTq9VS9M9ab1nrjXIurEO/pu+TozZiIpmAqBvu7P58G/vr5o2/7MqQC
	fBBuYtAA7ykFGC3hUll0/YThZhgFmABZ+RgF2F9z+hjFOnpQX4qKVITNNcWrsEnCw4GssLm
	4XA6I2Ub6wmhaPc=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

During 'make modules_install', the need-compiler variable becomes
null, so Makefile.compiler isn't included.

This results in call cc-option-yn returning nothing.

For more technical details on why need-compiler is null during
‘make modules_install’ and why no compiler invocation is actually
needed at this point, please refer to commit 4fe4a6374c4d ("MIPS:
Only fiddle with CHECKFLAGS if need-compiler") and commit
805b2e1d427a ("kbuild: include Makefile.compiler only when compiler
is needed").

Commit a79a404e6c22 ("MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS
`modules_install' regression") tried to fix the same issue but it
caused a compile error on clang compiler because it doesn't support
'-msym32'. Then, commit 18ca63a2e23c ("MIPS: Probe toolchain support
of -msym32") fixed it but reintroduced the CONFIG_CPU_DADDI_WORKAROUNDS
`modules_install' regression.

Wrapping this entire code block with #ifdef need-compiler to avoid
all issues is the best solution for now.

To get rid of spurious "CONFIG_CPU_DADDI_WORKAROUNDS unsupported
without -msym32" error.

Link: https://lore.kernel.org/all/alpine.DEB.2.21.2502120612000.65342@angie.orcam.me.uk/
Link: https://lore.kernel.org/all/alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk/
Fixes: a79a404e6c22 ("MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS `modules_install' regression")
Reported-by: Maciej W. Rozycki <macro@orcam.me.uk>
Closes: https://lore.kernel.org/all/alpine.DEB.2.21.2501030535080.49841@angie.orcam.me.uk/
Co-developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index be8cb44a89fd..89928d6d4b5b 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -288,6 +288,7 @@ entry-y				= $(shell $(objtree)/arch/mips/tools/elf-entry vmlinux)
 cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
 
+ifdef need-compiler
 #
 # Automatically detect the build format. By default we choose
 # the elf format according to the load address.
@@ -308,7 +309,8 @@ ifdef CONFIG_64BIT
       $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
     endif
   endif
-endif
+endif # CONFIG_64BIT
+endif # need-compiler
 
 # When linking a 32-bit executable the LLVM linker cannot cope with a
 # 32-bit load address that has been sign-extended to 64 bits.  Simply
-- 
2.47.2



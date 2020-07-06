Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24667215109
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2020 03:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbgGFBxQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Jul 2020 21:53:16 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:40388 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728528AbgGFBxQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Jul 2020 21:53:16 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 64C721FEF9;
        Mon,  6 Jul 2020 01:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1593999947; bh=JUtweFfIfUaNiYWjrOM8eKxxOZSb4TtblpLjczU23ew=;
        h=From:To:Cc:Subject:Date:From;
        b=fin3r9Djg/W7oG7Nqju+dTO8ryvScgWU1OaLZNfrVmAOnm9tcP4hjbjx4Fs+9+k4b
         ZC9ZYnfwu2OiVq54JqtSFtAKT/YpWVhHl0HdPyeyfA+EbRujv4khPnKiX1Jd+J0ZPN
         PO0Vpggp611ezJW9SGCLO/H0cs6w9sV6iZxCekoSXaupHqYeZdTr32K375DOv1+l2V
         9cQRtnkXdsnI+pFTwZ+Zn261t1k4TCPCwCAYO7vBavgUvxbiuafOLuwhk9nzb8rbVL
         e9EneMkAS0Biu3AtEmKTx5UudS6a5XqBxiLbTW10Luabq3mwXCz6Aj3GmmjP0M2JnU
         C7hcQJ8uvFx/A==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     kvm@vger.kernel.org
Cc:     chenhc@lemote.com, aleksandar.qemu.devel@gmail.com,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: KVM: Convert a fallthrough comment to fallthrough
Date:   Mon,  6 Jul 2020 09:45:34 +0800
Message-Id: <20200706014534.352509-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is a fallthrough comment being forgotten,
GCC complains about it:

arch/mips/kvm/emulate.c: In function kvm_mips_emulate_load:
arch/mips/kvm/emulate.c:1936:21: error: this statement may fall through
 1936 |   vcpu->mmio_needed = 1; /* unsigned */
      |   ~~~~~~~~~~~~~~~~~~^~~
arch/mips/kvm/emulate.c:1939:2: note: here
 1939 |  case lw_op:

Just fix it.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kvm/emulate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 5ae82d925197..bb17d8274462 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -1934,7 +1934,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 
 	case lwu_op:
 		vcpu->mmio_needed = 1;	/* unsigned */
-		/* fall through */
+		fallthrough;
 #endif
 	case lw_op:
 		run->mmio.len = 4;
-- 
2.27.0


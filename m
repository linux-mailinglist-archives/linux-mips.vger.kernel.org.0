Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485112400AD
	for <lists+linux-mips@lfdr.de>; Mon, 10 Aug 2020 03:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgHJBSG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Aug 2020 21:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgHJBSG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Aug 2020 21:18:06 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954DAC061756;
        Sun,  9 Aug 2020 18:18:06 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 424221FEB9;
        Mon, 10 Aug 2020 01:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1597022285; bh=8jQ64yO0EFa1VJiLGME1MgLg11GF98tS7gIUdOBhOiQ=;
        h=From:To:Cc:Subject:Date:From;
        b=EEsH19KDnT1uEf4a0B9NIhWOOU6stKWgPIlQlNyf1tFohCU6+sDlevBNZYeoIXnKu
         jBb12KbUfFWx0XytP/6KnJaSstuzquOS8M1HxxCsFvQM+tBJPoKsuyaHTxd/nKLMzE
         Qlsj8iOkPey4IxTTBE+05/3pg3Yab/5j4pH1J6PkM6l/U+hkMn/lLxaEs+Er24Qhtv
         XvGkfcteTSjL1KvWZyakXbSsdbpgzczz8JbhvbYeE5G2ktAbl+/XDxEs3DdBhHO5P2
         dboxNGj0cLxEOjieFR/q6Fv8Zjez89fVeKns9Thb97wfvOoKTSW0BVzp4Le7/Ln44Y
         VkbbCAyyckmRQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     kvm@vger.kernel.org
Cc:     pbonzini@redhat.com, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND for-5.9] MIPS: KVM: Convert a fallthrough comment to fallthrough
Date:   Mon, 10 Aug 2020 09:17:49 +0800
Message-Id: <20200810011749.3211128-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
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
Reviewed-by: Huacai Chen <chenhc@lemote.com>
---
This is blocking KVM MIPS from build, so it needs to get into 5.9.
---
 arch/mips/kvm/emulate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 703782355318..d70c4f8e14e2 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -1935,7 +1935,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 
 	case lwu_op:
 		vcpu->mmio_needed = 1;	/* unsigned */
-		/* fall through */
+		fallthrough;
 #endif
 	case lw_op:
 		run->mmio.len = 4;
-- 
2.28.0.rc1


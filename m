Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8ED21AFFB
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 09:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgGJHVQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jul 2020 03:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgGJHVQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Jul 2020 03:21:16 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFF5C08C5CE;
        Fri, 10 Jul 2020 00:21:16 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q17so1883287pls.9;
        Fri, 10 Jul 2020 00:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=lKn1gJPWAF3xCGoJfzCQprGwxZKYhV13Di2vFMkiPwU=;
        b=Cdth6s5BDzvWIcTFQtl1GiJab7NvY2MWI7cSZO0DzMZZI6Yso3NDBEdHJO1UBJN6sW
         YWk7trE3R0c4U4T+zkGiQoubhS5G6YpoghznjD0MDyijU57SLEZCPeqDPWZojicFQdzF
         bgXEC5Qv45JDSSY/3ofqMZlHi51pYTxJuiF2WNGX5J+stKKwQ97WS1YGlOWsQYUj/h6K
         dHJBCq0OVztahA8gtmzXT1/aSjK7SI5qhE2hBJJXeAANwL18SsJAs+5H8xv3HsWEf+U5
         sSW0ZEZ41iQeCGRDGCNpzXCC72fBqbm5ovuacRFDqyykH8bzxo5sLdGIiTUHEM+3JIZn
         ZwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=lKn1gJPWAF3xCGoJfzCQprGwxZKYhV13Di2vFMkiPwU=;
        b=bBojgyZNkLAT41t36mk86Ja/Vv4YAQgCDR1svJUVfYMOfHGIVr6ZAdFrEJ/gpCBU7p
         LB1kh5BqOP81wqn21icUF8KZo4kjFAhDITZbC45mHeaHM3XFWBqGg6zqu7b+M9N0Fy7F
         UZxFZ6x0f8jTBdPNVhWmMY3k3aH32ZXoe3eNNtsC+W5WC1cQDaoK2K3t+5i3RWL2TeuW
         V+G6b+ofHqArImrXsc+mRyy4Sr62R1gCxuKzijd03EPtMe/ma2InmxHZ+InEZH7QK/Xo
         5PCCm15tNGwXypi9ZKYn4YxoYErLqujg+YdxN3Wl/RclaO4jmCv3ILUlRZihvqD1obqN
         ypAA==
X-Gm-Message-State: AOAM533UC1m/OknBBIeaCVqGlth1P5SulDqAm6RK3wSQD6XVQZ2jGSap
        8bHaJAe+pXtxVqeAeh9SAlC2HLBc1jj1xg==
X-Google-Smtp-Source: ABdhPJxT8JqIehWkOMptuYE0fjcRDwBcxZZEW2ZhyEExBpOeSwALsjELvi4Z7Vf+1yq9vjK9WpNAxQ==
X-Received: by 2002:a17:902:b705:: with SMTP id d5mr47019814pls.118.1594365676112;
        Fri, 10 Jul 2020 00:21:16 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id q10sm5411635pfk.86.2020.07.10.00.21.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Jul 2020 00:21:15 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] KVM: MIPS: Fix build errors for 32bit kernel
Date:   Fri, 10 Jul 2020 15:23:17 +0800
Message-Id: <1594365797-536-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit dc6d95b153e78ed70b1b2c04a ("KVM: MIPS: Add more MMIO load/store
instructions emulation") introduced some 64bit load/store instructions
emulation which are unavailable on 32bit platform, and it causes build
errors:

arch/mips/kvm/emulate.c: In function 'kvm_mips_emulate_store':
arch/mips/kvm/emulate.c:1734:6: error: right shift count >= width of type [-Werror]
      ((vcpu->arch.gprs[rt] >> 56) & 0xff);
      ^
arch/mips/kvm/emulate.c:1738:6: error: right shift count >= width of type [-Werror]
      ((vcpu->arch.gprs[rt] >> 48) & 0xffff);
      ^
arch/mips/kvm/emulate.c:1742:6: error: right shift count >= width of type [-Werror]
      ((vcpu->arch.gprs[rt] >> 40) & 0xffffff);
      ^
arch/mips/kvm/emulate.c:1746:6: error: right shift count >= width of type [-Werror]
      ((vcpu->arch.gprs[rt] >> 32) & 0xffffffff);
      ^
arch/mips/kvm/emulate.c:1796:6: error: left shift count >= width of type [-Werror]
      (vcpu->arch.gprs[rt] << 32);
      ^
arch/mips/kvm/emulate.c:1800:6: error: left shift count >= width of type [-Werror]
      (vcpu->arch.gprs[rt] << 40);
      ^
arch/mips/kvm/emulate.c:1804:6: error: left shift count >= width of type [-Werror]
      (vcpu->arch.gprs[rt] << 48);
      ^
arch/mips/kvm/emulate.c:1808:6: error: left shift count >= width of type [-Werror]
      (vcpu->arch.gprs[rt] << 56);
      ^
cc1: all warnings being treated as errors
make[3]: *** [arch/mips/kvm/emulate.o] Error 1

So, use #if defined(CONFIG_64BIT) && defined(CONFIG_KVM_MIPS_VZ) to
guard the 64bit load/store instructions emulation.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: dc6d95b153e78ed70b1b2c04a ("KVM: MIPS: Add more MMIO load/store instructions emulation")
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kvm/emulate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 5ae82d9..d242300c 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -1722,6 +1722,7 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
 			  vcpu->arch.gprs[rt], *(u32 *)data);
 		break;
 
+#if defined(CONFIG_64BIT) && defined(CONFIG_KVM_MIPS_VZ)
 	case sdl_op:
 		run->mmio.phys_addr = kvm_mips_callbacks->gva_to_gpa(
 					vcpu->arch.host_cp0_badvaddr) & (~0x7);
@@ -1815,6 +1816,7 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
 			  vcpu->arch.pc, vcpu->arch.host_cp0_badvaddr,
 			  vcpu->arch.gprs[rt], *(u64 *)data);
 		break;
+#endif
 
 #ifdef CONFIG_CPU_LOONGSON64
 	case sdc2_op:
@@ -2002,6 +2004,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 		}
 		break;
 
+#if defined(CONFIG_64BIT) && defined(CONFIG_KVM_MIPS_VZ)
 	case ldl_op:
 		run->mmio.phys_addr = kvm_mips_callbacks->gva_to_gpa(
 					vcpu->arch.host_cp0_badvaddr) & (~0x7);
@@ -2073,6 +2076,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 			break;
 		}
 		break;
+#endif
 
 #ifdef CONFIG_CPU_LOONGSON64
 	case ldc2_op:
-- 
2.7.0


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1721F9150
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2020 10:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgFOI0k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jun 2020 04:26:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59045 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbgFOI0k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jun 2020 04:26:40 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jkkRw-00013P-LO; Mon, 15 Jun 2020 08:26:36 +0000
From:   Colin King <colin.king@canonical.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: MIPS: fix spelling mistake "Exteneded" -> "Extended"
Date:   Mon, 15 Jun 2020 09:26:36 +0100
Message-Id: <20200615082636.7004-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a couple of kvm_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/mips/kvm/emulate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 5ae82d925197..d3d322f70fe0 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -1861,7 +1861,7 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
 				  vcpu->arch.gprs[rt], *(u64 *)data);
 			break;
 		default:
-			kvm_err("Godson Exteneded GS-Store not yet supported (inst=0x%08x)\n",
+			kvm_err("Godson Extended GS-Store not yet supported (inst=0x%08x)\n",
 				inst.word);
 			break;
 		}
@@ -2103,7 +2103,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 			vcpu->mmio_needed = 30;	/* signed */
 			break;
 		default:
-			kvm_err("Godson Exteneded GS-Load for float not yet supported (inst=0x%08x)\n",
+			kvm_err("Godson Extended GS-Load for float not yet supported (inst=0x%08x)\n",
 				inst.word);
 			break;
 		}
-- 
2.27.0.rc0


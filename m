Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 655E5128A3A
	for <lists+linux-mips@lfdr.de>; Sat, 21 Dec 2019 16:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfLUPua (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Dec 2019 10:50:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:59956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726107AbfLUPua (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 21 Dec 2019 10:50:30 -0500
Received: from jamesdev.lan (jahogan.plus.com [212.159.75.221])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F49E2070B;
        Sat, 21 Dec 2019 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576943429;
        bh=Qpdhp38TYluaHjQoJc0KYQrsy0xlL38Nc30CTBJJEuQ=;
        h=From:To:Cc:Subject:Date:From;
        b=z7r33QPFF3aXcFJ9uX4qP176TqRj0ssGenGrBFE9kdgh1btHptcSCqviiGFNLXCro
         mwjAruWCGWL/RnInHf70OTTZ3hrk2xjnqt0BYduE4Nflf2Q5CO3Wu4augkHwJ/eL1W
         D2mbHinA9O38QH1dA87ioA7li78tpBXD3LeuylV4=
From:   James Hogan <jhogan@kernel.org>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
        Paul Burton <paulburton@kernel.org>
Cc:     James Hogan <jhogan@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Orphan KVM for MIPS
Date:   Sat, 21 Dec 2019 15:50:13 +0000
Message-Id: <20191221155013.49080-1-jhogan@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I haven't been active for 18 months, and don't have the hardware set up
to test KVM for MIPS, so mark it as orphaned and remove myself as
maintainer. Hopefully somebody from MIPS can pick this up.

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: kvm@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 19d17815c0fb..010bb51bedcb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9074,9 +9074,8 @@ F:	virt/kvm/arm/
 F:	include/kvm/arm_*
 
 KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
-M:	James Hogan <jhogan@kernel.org>
 L:	linux-mips@vger.kernel.org
-S:	Supported
+S:	Orphan
 F:	arch/mips/include/uapi/asm/kvm*
 F:	arch/mips/include/asm/kvm*
 F:	arch/mips/kvm/
-- 
2.24.0


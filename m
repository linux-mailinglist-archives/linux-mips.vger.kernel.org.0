Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 247F61523EF
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 01:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgBEALl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Feb 2020 19:11:41 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:56289 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727726AbgBEALk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Feb 2020 19:11:40 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C939E891B0;
        Wed,  5 Feb 2020 13:11:38 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1580861498;
        bh=CNZrY07wx1fsMckb/UiVqAZ4mkkD9Vh2atjTCMywA4E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=jjB0KZYQnKCcQGimnKStgEBKGek+bfwua/MGbzemlcgG8UiJF+E9Yb5hWOngZarPR
         XqmxT6CXLouk6kxK4YerEIrVg8uYuaENtzE3T0U1Yvv8ycah8wErv3IOsUmSGihC9u
         wmz4GENDpWpD6jblfDFmntctNrCKoYPYsZmKhQ655oH/9ZxYX+aN+RXk6u5APiOxlu
         JrSjDErrWW8LZP5ItZu8KsUs31SKmUqGytBizu75nXW54lFYD2LJni4C23WKJYpeZX
         XYuUQTYx3IHmaWMM04vsr25d0pWZj4OdVQz46MMFf08d1y6JHrrztvqL38QNQIoS+0
         tlawgtbMQlAvw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e3a083a0003>; Wed, 05 Feb 2020 13:11:39 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 1406113EEDE;
        Wed,  5 Feb 2020 13:11:38 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 841E5280038; Wed,  5 Feb 2020 13:11:38 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregkh@linuxfoundation.org, ralf@linux-mips.org,
        paulburton@kernel.org, linux@roeck-us.net,
        dan.carpenter@oracle.com, willy@infradead.org
Cc:     linux-mips@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 5/6] MIPS: octeon: remove typedef declaration for cvmx_pko_command_word0
Date:   Wed,  5 Feb 2020 13:11:15 +1300
Message-Id: <20200205001116.14096-6-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200205001116.14096-1-chris.packham@alliedtelesis.co.nz>
References: <20200205001116.14096-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove the typedef and update usage to use the union.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/mips/cavium-octeon/executive/cvmx-helper.c | 2 +-
 arch/mips/include/asm/octeon/cvmx-pko.h         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/=
cavium-octeon/executive/cvmx-helper.c
index 8002f9d3039d..6044ff471002 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -782,7 +782,7 @@ static int __cvmx_helper_errata_fix_ipd_ptr_alignment=
(void)
 #define INTERFACE(port) (port >> 4)
 #define INDEX(port) (port & 0xf)
 	uint64_t *p64;
-	cvmx_pko_command_word0_t pko_command;
+	union cvmx_pko_command_word0 pko_command;
 	union cvmx_buf_ptr g_buffer, pkt_buffer;
 	struct cvmx_wqe *work;
 	int size, num_segs =3D 0, wqe_pcnt, pkt_pcnt;
diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/=
asm/octeon/cvmx-pko.h
index f033523c19f8..5b0b982a36f7 100644
--- a/arch/mips/include/asm/octeon/cvmx-pko.h
+++ b/arch/mips/include/asm/octeon/cvmx-pko.h
@@ -169,7 +169,7 @@ typedef union {
 /**
  * Structure of the first packet output command word.
  */
-typedef union {
+union cvmx_pko_command_word0 {
 	uint64_t u64;
 	struct {
 #ifdef __BIG_ENDIAN_BITFIELD
@@ -261,7 +261,7 @@ typedef union {
 	        uint64_t size1:2;
 #endif
 	} s;
-} cvmx_pko_command_word0_t;
+};
=20
 /* CSR typedefs have been moved to cvmx-csr-*.h */
=20
@@ -419,7 +419,7 @@ static inline void cvmx_pko_send_packet_prepare(uint6=
4_t port, uint64_t queue,
 static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(
 	uint64_t port,
 	uint64_t queue,
-	cvmx_pko_command_word0_t pko_command,
+	union cvmx_pko_command_word0 pko_command,
 	union cvmx_buf_ptr packet,
 	cvmx_pko_lock_t use_locking)
 {
@@ -462,7 +462,7 @@ static inline cvmx_pko_status_t cvmx_pko_send_packet_=
finish(
 static inline cvmx_pko_status_t cvmx_pko_send_packet_finish3(
 	uint64_t port,
 	uint64_t queue,
-	cvmx_pko_command_word0_t pko_command,
+	union cvmx_pko_command_word0 pko_command,
 	union cvmx_buf_ptr packet,
 	uint64_t addr,
 	cvmx_pko_lock_t use_locking)
--=20
2.25.0


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9851B1523F0
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 01:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgBEALm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Feb 2020 19:11:42 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:56303 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbgBEALl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Feb 2020 19:11:41 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C9259891AF;
        Wed,  5 Feb 2020 13:11:38 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1580861498;
        bh=d77I6V+GYXRtq9n5V+bGAtl2IdeOVWqjwTHtyOh+tEU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=xYM8fMqSwHNZ4b1ylxWaCOgTpJ2YE7yuGt9jT3x021LZlSXYzPoEt4wY0DLxNEfz/
         tTctlpXqxGnXheUcp1fq5pzdPTv6i048uHawuVBxfnKMK4lCUL4Vd2edl+kIJpWSns
         v4FbZDmIjKYAG4bAvQV0dmeKajX06WM05cilzXJ5E+ATctkwci8YV7C+nbomA2SIaw
         1NE9mA9GkfYEfmUoSrTp7JebsPxBeJi+4dUluvjz3XJ5cU/OcwJ6cXHssBGLJk8TQP
         T0zWCWPOlOQljJwOcTGIffzjmEKnOfJswUaNng591rY4Uygo+eB81X9xaXRbGjQbbV
         uyxY3BCrMWbBw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e3a083a0002>; Wed, 05 Feb 2020 13:11:38 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id E04FD13EEDE;
        Wed,  5 Feb 2020 13:11:37 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 5C514280038; Wed,  5 Feb 2020 13:11:38 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregkh@linuxfoundation.org, ralf@linux-mips.org,
        paulburton@kernel.org, linux@roeck-us.net,
        dan.carpenter@oracle.com, willy@infradead.org
Cc:     linux-mips@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 4/6] MIPS: octeon: remove typedef declaration for cvmx_helper_link_info
Date:   Wed,  5 Feb 2020 13:11:14 +1300
Message-Id: <20200205001116.14096-5-chris.packham@alliedtelesis.co.nz>
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

Remove declaration of union cvmx_helper_link_info as typedef and update
uses to use the union.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/mips/cavium-octeon/executive/cvmx-helper-board.c | 4 ++--
 arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c | 6 +++---
 arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c | 8 ++++----
 arch/mips/cavium-octeon/executive/cvmx-helper-spi.c   | 6 +++---
 arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c  | 6 +++---
 arch/mips/cavium-octeon/executive/cvmx-helper.c       | 6 +++---
 arch/mips/include/asm/octeon/cvmx-helper-board.h      | 2 +-
 arch/mips/include/asm/octeon/cvmx-helper-rgmii.h      | 4 ++--
 arch/mips/include/asm/octeon/cvmx-helper-sgmii.h      | 4 ++--
 arch/mips/include/asm/octeon/cvmx-helper-spi.h        | 4 ++--
 arch/mips/include/asm/octeon/cvmx-helper-xaui.h       | 4 ++--
 arch/mips/include/asm/octeon/cvmx-helper.h            | 8 ++++----
 12 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c b/arch=
/mips/cavium-octeon/executive/cvmx-helper-board.c
index 2e2d45bc850d..abd11b7af22f 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
@@ -207,9 +207,9 @@ int cvmx_helper_board_get_mii_address(int ipd_port)
  * Returns The ports link status. If the link isn't fully resolved, this=
 must
  *	   return zero.
  */
-cvmx_helper_link_info_t __cvmx_helper_board_link_get(int ipd_port)
+union cvmx_helper_link_info __cvmx_helper_board_link_get(int ipd_port)
 {
-	cvmx_helper_link_info_t result;
+	union cvmx_helper_link_info result;
=20
 	WARN(!octeon_is_simulation(),
 	     "Using deprecated link status - please update your DT");
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c b/arch=
/mips/cavium-octeon/executive/cvmx-helper-rgmii.c
index e812ed9a03bb..c4b58598aa9d 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c
@@ -261,7 +261,7 @@ int __cvmx_helper_rgmii_enable(int interface)
  *
  * Returns Link state
  */
-cvmx_helper_link_info_t __cvmx_helper_rgmii_link_get(int ipd_port)
+union cvmx_helper_link_info __cvmx_helper_rgmii_link_get(int ipd_port)
 {
 	int interface =3D cvmx_helper_get_interface_num(ipd_port);
 	int index =3D cvmx_helper_get_interface_index_num(ipd_port);
@@ -270,7 +270,7 @@ cvmx_helper_link_info_t __cvmx_helper_rgmii_link_get(=
int ipd_port)
 	asxx_prt_loop.u64 =3D cvmx_read_csr(CVMX_ASXX_PRT_LOOP(interface));
 	if (asxx_prt_loop.s.int_loop & (1 << index)) {
 		/* Force 1Gbps full duplex on internal loopback */
-		cvmx_helper_link_info_t result;
+		union cvmx_helper_link_info result;
 		result.u64 =3D 0;
 		result.s.full_duplex =3D 1;
 		result.s.link_up =3D 1;
@@ -292,7 +292,7 @@ cvmx_helper_link_info_t __cvmx_helper_rgmii_link_get(=
int ipd_port)
  * Returns Zero on success, negative on failure
  */
 int __cvmx_helper_rgmii_link_set(int ipd_port,
-				 cvmx_helper_link_info_t link_info)
+				 union cvmx_helper_link_info link_info)
 {
 	int result =3D 0;
 	int interface =3D cvmx_helper_get_interface_num(ipd_port);
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c b/arch=
/mips/cavium-octeon/executive/cvmx-helper-sgmii.c
index f6ebf63dc84c..e07d8f15efba 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c
@@ -200,7 +200,7 @@ static int __cvmx_helper_sgmii_hardware_init_link(int=
 interface, int index)
  */
 static int __cvmx_helper_sgmii_hardware_init_link_speed(int interface,
 							int index,
-							cvmx_helper_link_info_t
+							union cvmx_helper_link_info
 							link_info)
 {
 	int is_enabled;
@@ -394,9 +394,9 @@ int __cvmx_helper_sgmii_enable(int interface)
  *
  * Returns Link state
  */
-cvmx_helper_link_info_t __cvmx_helper_sgmii_link_get(int ipd_port)
+union cvmx_helper_link_info __cvmx_helper_sgmii_link_get(int ipd_port)
 {
-	cvmx_helper_link_info_t result;
+	union cvmx_helper_link_info result;
 	union cvmx_pcsx_miscx_ctl_reg pcs_misc_ctl_reg;
 	int interface =3D cvmx_helper_get_interface_num(ipd_port);
 	int index =3D cvmx_helper_get_interface_index_num(ipd_port);
@@ -505,7 +505,7 @@ cvmx_helper_link_info_t __cvmx_helper_sgmii_link_get(=
int ipd_port)
  * Returns Zero on success, negative on failure
  */
 int __cvmx_helper_sgmii_link_set(int ipd_port,
-				 cvmx_helper_link_info_t link_info)
+				 union cvmx_helper_link_info link_info)
 {
 	int interface =3D cvmx_helper_get_interface_num(ipd_port);
 	int index =3D cvmx_helper_get_interface_index_num(ipd_port);
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-spi.c b/arch/m=
ips/cavium-octeon/executive/cvmx-helper-spi.c
index 2a574d272671..525914e9b22d 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-spi.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-spi.c
@@ -140,9 +140,9 @@ int __cvmx_helper_spi_enable(int interface)
  *
  * Returns Link state
  */
-cvmx_helper_link_info_t __cvmx_helper_spi_link_get(int ipd_port)
+union cvmx_helper_link_info __cvmx_helper_spi_link_get(int ipd_port)
 {
-	cvmx_helper_link_info_t result;
+	union cvmx_helper_link_info result;
 	int interface =3D cvmx_helper_get_interface_num(ipd_port);
 	int index =3D cvmx_helper_get_interface_index_num(ipd_port);
 	result.u64 =3D 0;
@@ -193,7 +193,7 @@ cvmx_helper_link_info_t __cvmx_helper_spi_link_get(in=
t ipd_port)
  *
  * Returns Zero on success, negative on failure
  */
-int __cvmx_helper_spi_link_set(int ipd_port, cvmx_helper_link_info_t lin=
k_info)
+int __cvmx_helper_spi_link_set(int ipd_port, union cvmx_helper_link_info=
 link_info)
 {
 	/* Nothing to do. If we have a SPI4000 then the setup was already perfo=
rmed
 	   by cvmx_spi4000_check_speed(). If not then there isn't any link
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c b/arch/=
mips/cavium-octeon/executive/cvmx-helper-xaui.c
index 93a498d05184..842990e8404f 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c
@@ -259,13 +259,13 @@ int __cvmx_helper_xaui_enable(int interface)
  *
  * Returns Link state
  */
-cvmx_helper_link_info_t __cvmx_helper_xaui_link_get(int ipd_port)
+union cvmx_helper_link_info __cvmx_helper_xaui_link_get(int ipd_port)
 {
 	int interface =3D cvmx_helper_get_interface_num(ipd_port);
 	union cvmx_gmxx_tx_xaui_ctl gmxx_tx_xaui_ctl;
 	union cvmx_gmxx_rx_xaui_ctl gmxx_rx_xaui_ctl;
 	union cvmx_pcsxx_status1_reg pcsxx_status1_reg;
-	cvmx_helper_link_info_t result;
+	union cvmx_helper_link_info result;
=20
 	gmxx_tx_xaui_ctl.u64 =3D cvmx_read_csr(CVMX_GMXX_TX_XAUI_CTL(interface)=
);
 	gmxx_rx_xaui_ctl.u64 =3D cvmx_read_csr(CVMX_GMXX_RX_XAUI_CTL(interface)=
);
@@ -299,7 +299,7 @@ cvmx_helper_link_info_t __cvmx_helper_xaui_link_get(i=
nt ipd_port)
  *
  * Returns Zero on success, negative on failure
  */
-int __cvmx_helper_xaui_link_set(int ipd_port, cvmx_helper_link_info_t li=
nk_info)
+int __cvmx_helper_xaui_link_set(int ipd_port, union cvmx_helper_link_inf=
o link_info)
 {
 	int interface =3D cvmx_helper_get_interface_num(ipd_port);
 	union cvmx_gmxx_tx_xaui_ctl gmxx_tx_xaui_ctl;
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/=
cavium-octeon/executive/cvmx-helper.c
index bb84ae33399a..8002f9d3039d 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -1075,9 +1075,9 @@ int cvmx_helper_initialize_packet_io_local(void)
  *
  * Returns Link state
  */
-cvmx_helper_link_info_t cvmx_helper_link_get(int ipd_port)
+union cvmx_helper_link_info cvmx_helper_link_get(int ipd_port)
 {
-	cvmx_helper_link_info_t result;
+	union cvmx_helper_link_info result;
 	int interface =3D cvmx_helper_get_interface_num(ipd_port);
 	int index =3D cvmx_helper_get_interface_index_num(ipd_port);
=20
@@ -1136,7 +1136,7 @@ EXPORT_SYMBOL_GPL(cvmx_helper_link_get);
  *
  * Returns Zero on success, negative on failure
  */
-int cvmx_helper_link_set(int ipd_port, cvmx_helper_link_info_t link_info=
)
+int cvmx_helper_link_set(int ipd_port, union cvmx_helper_link_info link_=
info)
 {
 	int result =3D -1;
 	int interface =3D cvmx_helper_get_interface_num(ipd_port);
diff --git a/arch/mips/include/asm/octeon/cvmx-helper-board.h b/arch/mips=
/include/asm/octeon/cvmx-helper-board.h
index d7fdcf0a0088..ce52aafe7a8d 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper-board.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper-board.h
@@ -93,7 +93,7 @@ extern int cvmx_helper_board_get_mii_address(int ipd_po=
rt);
  * Returns The ports link status. If the link isn't fully resolved, this=
 must
  *	   return zero.
  */
-extern cvmx_helper_link_info_t __cvmx_helper_board_link_get(int ipd_port=
);
+extern union cvmx_helper_link_info __cvmx_helper_board_link_get(int ipd_=
port);
=20
 /**
  * This function is called by cvmx_helper_interface_probe() after it
diff --git a/arch/mips/include/asm/octeon/cvmx-helper-rgmii.h b/arch/mips=
/include/asm/octeon/cvmx-helper-rgmii.h
index ac42b5066bd9..3e79a7f898b6 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper-rgmii.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper-rgmii.h
@@ -74,7 +74,7 @@ extern int __cvmx_helper_rgmii_enable(int interface);
  *
  * Returns Link state
  */
-extern cvmx_helper_link_info_t __cvmx_helper_rgmii_link_get(int ipd_port=
);
+extern union cvmx_helper_link_info __cvmx_helper_rgmii_link_get(int ipd_=
port);
=20
 /**
  * Configure an IPD/PKO port for the specified link state. This
@@ -88,6 +88,6 @@ extern cvmx_helper_link_info_t __cvmx_helper_rgmii_link=
_get(int ipd_port);
  * Returns Zero on success, negative on failure
  */
 extern int __cvmx_helper_rgmii_link_set(int ipd_port,
-					cvmx_helper_link_info_t link_info);
+					union cvmx_helper_link_info link_info);
=20
 #endif
diff --git a/arch/mips/include/asm/octeon/cvmx-helper-sgmii.h b/arch/mips=
/include/asm/octeon/cvmx-helper-sgmii.h
index 3a54dea58c0a..8aac90f1871f 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper-sgmii.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper-sgmii.h
@@ -68,7 +68,7 @@ extern int __cvmx_helper_sgmii_enable(int interface);
  *
  * Returns Link state
  */
-extern cvmx_helper_link_info_t __cvmx_helper_sgmii_link_get(int ipd_port=
);
+extern union cvmx_helper_link_info __cvmx_helper_sgmii_link_get(int ipd_=
port);
=20
 /**
  * Configure an IPD/PKO port for the specified link state. This
@@ -82,6 +82,6 @@ extern cvmx_helper_link_info_t __cvmx_helper_sgmii_link=
_get(int ipd_port);
  * Returns Zero on success, negative on failure
  */
 extern int __cvmx_helper_sgmii_link_set(int ipd_port,
-					cvmx_helper_link_info_t link_info);
+					union cvmx_helper_link_info link_info);
=20
 #endif
diff --git a/arch/mips/include/asm/octeon/cvmx-helper-spi.h b/arch/mips/i=
nclude/asm/octeon/cvmx-helper-spi.h
index d5adf8592773..bc8cab9367b8 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper-spi.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper-spi.h
@@ -65,7 +65,7 @@ extern int __cvmx_helper_spi_enable(int interface);
  *
  * Returns Link state
  */
-extern cvmx_helper_link_info_t __cvmx_helper_spi_link_get(int ipd_port);
+extern union cvmx_helper_link_info __cvmx_helper_spi_link_get(int ipd_po=
rt);
=20
 /**
  * Configure an IPD/PKO port for the specified link state. This
@@ -79,6 +79,6 @@ extern cvmx_helper_link_info_t __cvmx_helper_spi_link_g=
et(int ipd_port);
  * Returns Zero on success, negative on failure
  */
 extern int __cvmx_helper_spi_link_set(int ipd_port,
-				      cvmx_helper_link_info_t link_info);
+				      union cvmx_helper_link_info link_info);
=20
 #endif
diff --git a/arch/mips/include/asm/octeon/cvmx-helper-xaui.h b/arch/mips/=
include/asm/octeon/cvmx-helper-xaui.h
index 51f45b495680..c18da2eba78e 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper-xaui.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper-xaui.h
@@ -68,7 +68,7 @@ extern int __cvmx_helper_xaui_enable(int interface);
  *
  * Returns Link state
  */
-extern cvmx_helper_link_info_t __cvmx_helper_xaui_link_get(int ipd_port)=
;
+extern union cvmx_helper_link_info __cvmx_helper_xaui_link_get(int ipd_p=
ort);
=20
 /**
  * Configure an IPD/PKO port for the specified link state. This
@@ -82,6 +82,6 @@ extern cvmx_helper_link_info_t __cvmx_helper_xaui_link_=
get(int ipd_port);
  * Returns Zero on success, negative on failure
  */
 extern int __cvmx_helper_xaui_link_set(int ipd_port,
-				       cvmx_helper_link_info_t link_info);
+				       union cvmx_helper_link_info link_info);
=20
 #endif
diff --git a/arch/mips/include/asm/octeon/cvmx-helper.h b/arch/mips/inclu=
de/asm/octeon/cvmx-helper.h
index ba0e76f578e0..c6c99e28eefb 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper.h
@@ -51,7 +51,7 @@ typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
 } cvmx_helper_interface_mode_t;
=20
-typedef union {
+union cvmx_helper_link_info {
 	uint64_t u64;
 	struct {
 		uint64_t reserved_20_63:44;
@@ -59,7 +59,7 @@ typedef union {
 		uint64_t full_duplex:1;	    /**< 1 if the link is full duplex */
 		uint64_t speed:18;	    /**< Speed of the link in Mbps */
 	} s;
-} cvmx_helper_link_info_t;
+};
=20
 #include <asm/octeon/cvmx-helper-errata.h>
 #include <asm/octeon/cvmx-helper-loop.h>
@@ -145,7 +145,7 @@ extern cvmx_helper_interface_mode_t cvmx_helper_inter=
face_get_mode(int
  *
  * Returns Link state
  */
-extern cvmx_helper_link_info_t cvmx_helper_link_get(int ipd_port);
+extern union cvmx_helper_link_info cvmx_helper_link_get(int ipd_port);
=20
 /**
  * Configure an IPD/PKO port for the specified link state. This
@@ -159,7 +159,7 @@ extern cvmx_helper_link_info_t cvmx_helper_link_get(i=
nt ipd_port);
  * Returns Zero on success, negative on failure
  */
 extern int cvmx_helper_link_set(int ipd_port,
-				cvmx_helper_link_info_t link_info);
+				union cvmx_helper_link_info link_info);
=20
 /**
  * This function probes an interface to determine the actual
--=20
2.25.0


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6CC32534A
	for <lists+linux-mips@lfdr.de>; Thu, 25 Feb 2021 17:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbhBYQNU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Feb 2021 11:13:20 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:49483 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233755AbhBYQKl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Feb 2021 11:10:41 -0500
Received: from buildfff.adridolf.com ([178.26.242.49]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MeTwY-1lnH1E2Hki-00aReA; Thu, 25 Feb 2021 17:07:56 +0100
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     Roman Kuzmitskii <damex.pp@icloud.com>
Subject: [PATCH] mips: octeon: Add Ubiquiti E300 board
Date:   Thu, 25 Feb 2021 17:07:13 +0100
Message-Id: <20210225160713.41828-1-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Zn6lEm2Ldprtt5SNH/eTw9XU9oBZ6uEIJnSHIhaQZqxpkBhLjUc
 26hRAiyJ8dhXXJb9+QosPsL9vpdpzGaqQYQ/DxTM51M3HZwkJJN9HFn4fDdr39BWA/mWZ60
 46F/BfaVseR3tlXjnNxPwg4iBvm28lXlj0acyltfTjc41IWq9aZPtY8SktqcUDl0hbsJvUt
 qZLmAMRZYsLO1kVXcIRzg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9lSXKT3wJCw=:lbm5v6sVCQQuC5R0YIAcYo
 0IAUxaPpuZ7boSpbxy/af+scVbvUdAmemUuuJMsftFxSK/M+ahj0gJjSlNtCOM+fQclv4MmPD
 VH41GamPRRb0qSYNE8aJ1fYPuj0s4oA3uUcZkG59VgFhnhJEAmbqnuiTvaOr/1qYt0zg8hGxT
 fauuvIFFND1IFEPsZXohFwH6iQjMqG6Gjc4rFhK00FXKgV2VKJePTWCTFeTCp4WsAjUFJtNbg
 69OtsdYruGytSPfwLVYdjlPP+CfXYCRf4cRgzUnSQzgD8MfzICN/3F87Q7qbE/Ft9oitVWb/w
 q4ycPpHJCiKICAJk1A2X5SLIUkNRIFKAmluYEL/rWLcM0bXTKkK9ZIUn0YvcpNcg5ksJ5HVg9
 Tu4w+vBl1oE6yaBr90WrJ1VD272mzj0D/KsCX2NQMHWWMXUg0v5+h8r+K4dWaDWnQ738idRfA
 s0o0wq3Tbg==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This board is used in Ubiquiti EdgeRouter 4.

Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
---
 arch/mips/include/asm/octeon/cvmx-bootinfo.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/octeon/cvmx-bootinfo.h b/arch/mips/include/asm/octeon/cvmx-bootinfo.h
index c114a7ba0bad..0e6bf220db61 100644
--- a/arch/mips/include/asm/octeon/cvmx-bootinfo.h
+++ b/arch/mips/include/asm/octeon/cvmx-bootinfo.h
@@ -298,6 +298,7 @@ enum cvmx_board_types_enum {
 	CVMX_BOARD_TYPE_UBNT_E200 = 20003,
 	CVMX_BOARD_TYPE_UBNT_E220 = 20005,
 	CVMX_BOARD_TYPE_CUST_DSR1000N = 20006,
+	CVMX_BOARD_TYPE_UBNT_E300 = 20300,
 	CVMX_BOARD_TYPE_KONTRON_S1901 = 21901,
 	CVMX_BOARD_TYPE_CUST_PRIVATE_MAX = 30000,
 
@@ -401,6 +402,7 @@ static inline const char *cvmx_board_type_to_string(enum
 		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_UBNT_E200)
 		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_UBNT_E220)
 		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_CUST_DSR1000N)
+		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_UBNT_E300)
 		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_KONTRON_S1901)
 		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_CUST_PRIVATE_MAX)
 	}
-- 
2.20.1


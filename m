Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB5E28A07B
	for <lists+linux-mips@lfdr.de>; Sat, 10 Oct 2020 15:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730475AbgJJMyx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Oct 2020 08:54:53 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40057 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726761AbgJJKQM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 10 Oct 2020 06:16:12 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id AE65A5C012A;
        Sat, 10 Oct 2020 06:09:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 10 Oct 2020 06:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dottedmag.net;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=XyySwKgYNUsVNUbd7I3Rz/31X+
        3Aiw9NjbKAkB3TXf0=; b=p/Uu5bAByUH+JeiiMIQ7wQLsr6ZM8lgS18PQ9ZAm1N
        Ej1RkoBr05v9jHRYHwYqDoclF+ONkJQALoh/HGU4lM0KgXMT/5Lh1z2B9FBYTT3c
        LiJfkI4rsugFTZrsjyc5M3KED/mkGIrsDFEAkFuwv/3qHOqw0fcSZlPCIMCgJFyS
        5ATUrRSWy10fjgDTj6vw8iBJsjp8JKBUoj0OZkPNgaUdVR60RYu5MZ83d1DsbDO7
        K21qmJcJlegOICRtiQxZrEolR9gFBnTvYWk0GCDvFWK4c9vcu/pruZJel9ZMw8Ll
        PTgk3eXXHLvGT8hVS+ZyFOboiYKe0wCqVY0gOWfLqGaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XyySwKgYNUsVNUbd7
        I3Rz/31X+3Aiw9NjbKAkB3TXf0=; b=rsacVxc9uaBeVJ4uh81yMRqfRs+8AKKwW
        ubMMnDYG9aHNg9krPlmELKBz97d38wGgHq7tsTyBZnU2njV4OQx7W50N8tSCzn2U
        6sC/ZQDInWe/TU47ppXd4msvhB8bKGmjwPbGrfHVw4Wwr7gGFg2kLjOD3QE/CVDC
        lXHxAvcbhKGn5Tuk/Ja8OgHJMVraAQrwt40b4nzxw0+/xlzZ5hUSMlV/ngahl7DV
        8E6R0XF4Yb0M6okZwUdu6vynwDFsf9CLrAJck77HlAoZu/2Dd/MqKQY6h2FQqZPR
        MKavzLnVpv2f3Jx3/VEvMNbOcRCHvhv8DJH07DRaug1UxTu36fE/Q==
X-ME-Sender: <xms:QYiBX3AMchVVVictRzn-syxRj7zm_BeyjvhNpPHYPkkB5WRsR20cpA>
    <xme:QYiBX9gH8nfQ-fIpcubmV3R9uWs4hrd4Kq8Vk4BCYArsUsLmYaTey3HKS8a8yJsZX
    QAbItb4M4g7f97J0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheefgddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofhikhhhrghilhcu
    ifhushgrrhhovhcuoeguohhtthgvughmrghgseguohhtthgvughmrghgrdhnvghtqeenuc
    ggtffrrghtthgvrhhnpeekvdeujeeiffehgeelleefudeujefgffetffethfettdevhfei
    vefgleejhfffkeenucfkphepledvrddvhedurdefgedrvddvkeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguohhtthgvughmrghgseguohht
    thgvughmrghgrdhnvght
X-ME-Proxy: <xmx:QYiBXym_mQcp1Nc_BWbwcZ17C_9kb0fEtZuhvJ7escWUJdZafImXLw>
    <xmx:QYiBX5ym5GrnT6YtYmYQNlk34lisNGRo1aPeAC6v8cZFLkSwu6pm8w>
    <xmx:QYiBX8TcHg1pUQ6Jc2gj9u52bqmdY6z8UxK1w3D-mCPLCnDyw9roGA>
    <xmx:QYiBX144xrjaF80l4HYYl2LekdO3VWs5014zCTfy6Kb0LsuNt213pQ>
Received: from newton.malta.dottedmag.net (c34-228.i07-9.onvol.net [92.251.34.228])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1DB12306467D;
        Sat, 10 Oct 2020 06:09:05 -0400 (EDT)
Received: by newton.malta.dottedmag.net (Postfix, from userid 501)
        id 6EB5E406F7D8; Sat, 10 Oct 2020 12:09:03 +0200 (CEST)
From:   Mikhail Gusarov <dottedmag@dottedmag.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     Mikhail Gusarov <dottedmag@dottedmag.net>
Subject: [PATCH] mips: octeon: Add Ubiquiti E200 and E220 boards
Date:   Sat, 10 Oct 2020 12:08:58 +0200
Message-Id: <20201010100858.65438-1-dottedmag@dottedmag.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

These boards are used in
- Ubiquiti EdgeRouter (E200),
- Ubiquiti EdgeRouter Pro (E200) and
- Ubiquiti Security Gateway Pro 4 (E220).

Signed-off-by: Mikhail Gusarov <dottedmag@dottedmag.net>
---
 arch/mips/include/asm/octeon/cvmx-bootinfo.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/octeon/cvmx-bootinfo.h b/arch/mips/include/asm/octeon/cvmx-bootinfo.h
index 62787765575e..c114a7ba0bad 100644
--- a/arch/mips/include/asm/octeon/cvmx-bootinfo.h
+++ b/arch/mips/include/asm/octeon/cvmx-bootinfo.h
@@ -295,6 +295,8 @@ enum cvmx_board_types_enum {
 	 */
 	CVMX_BOARD_TYPE_CUST_PRIVATE_MIN = 20001,
 	CVMX_BOARD_TYPE_UBNT_E100 = 20002,
+	CVMX_BOARD_TYPE_UBNT_E200 = 20003,
+	CVMX_BOARD_TYPE_UBNT_E220 = 20005,
 	CVMX_BOARD_TYPE_CUST_DSR1000N = 20006,
 	CVMX_BOARD_TYPE_KONTRON_S1901 = 21901,
 	CVMX_BOARD_TYPE_CUST_PRIVATE_MAX = 30000,
@@ -396,6 +398,8 @@ static inline const char *cvmx_board_type_to_string(enum
 		    /* Customer private range */
 		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_CUST_PRIVATE_MIN)
 		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_UBNT_E100)
+		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_UBNT_E200)
+		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_UBNT_E220)
 		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_CUST_DSR1000N)
 		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_KONTRON_S1901)
 		ENUM_BRD_TYPE_CASE(CVMX_BOARD_TYPE_CUST_PRIVATE_MAX)
-- 
2.28.0


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 675A819BFAE
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2020 12:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387726AbgDBKvu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Apr 2020 06:51:50 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17894 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728803AbgDBKvu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Apr 2020 06:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585824675;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=2ZkDlSkG9tMmD6a2pvqpIEn/4AgTSzeX4OVgQR+P218=;
        b=duAuIt+7b7wfnpwDX+4LKxYfNoxv14K5WHzg8eGu4/HciSn8ct/LNeOrgUiURN55
        C1f5/RzqF1DBv+zU+kaaxN54X/PzIqxUOFejyguflkbTUlvOwvgf64C1oMQKExKJWAc
        x6LmWmT2wFbNDkiTPsDEqYYzwTDKQjSw+6uA0qLU=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585824674387233.19116750657258; Thu, 2 Apr 2020 18:51:14 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-ID: <20200402104851.368465-4-jiaxun.yang@flygoat.com>
Subject: [PATCH 4/5] MIPS: DTS: Loongson64: Add ACPI Controller Node
Date:   Thu,  2 Apr 2020 18:48:42 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200402104851.368465-1-jiaxun.yang@flygoat.com>
References: <20200402104851.368465-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add ACPI Controller Node for RS780E PCH to fit newly added driver.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi b/arch/mips/boot/d=
ts/loongson/rs780e-pch.dtsi
index 8766f97306c6..5e68ceae20ca 100644
--- a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
@@ -36,6 +36,11 @@ rtc0: rtc@70 {
 =09=09=09=09interrupts =3D <8>;
 =09=09=09=09interrupt-parent =3D <&htpic>;
 =09=09=09};
+
+=09=09=09acpi@800 {
+=09=09=09=09compatible =3D "loongson,rs780e-acpi";
+=09=09=09=09reg =3D <1 0x800 0x100>;
+=09=09=09};
 =09=09};
 =09};
 };
--=20
2.26.0.rc2



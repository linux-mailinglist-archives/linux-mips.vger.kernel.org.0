Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB5CCEEFD
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2019 00:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbfJGWUH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 18:20:07 -0400
Received: from mail-eopbgr730116.outbound.protection.outlook.com ([40.107.73.116]:58336
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728654AbfJGWUG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 18:20:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iitl1K3OvL7pnA4iAUB04GzNNXmJH7dFFZrCbah8Y9JA3vtNKzCG5dgFFb5rjGyqckdO5c+6D5Fr+TSngdxdpINKPB+U7jG2/FwBY8zi8NMDbOGOGTiQ+8LrNGMSIiMuynmGf1Ttb7vU5fN8+VW4iirmm5zb/ilDpOxPZkMoipqo85bfSii4qj1KVo/exrX+r+STon6xEm75Hqu2Zu/+LocoZjg57KUBmjA/KL8rWQtkyRuP8XGtaeNGwaXq5+x91P743BbsQOVdjGsTYptq2rXbDw8IizifmNsE9VQrh3TVxuf0rbJqt6CaCrD3L1AEA3ANh+O3XR3UslLwGjOfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rwbha+idgLkB1T5tDkxQCYVHMus56qhZWJ2fGWztFSg=;
 b=IGVGLl4GzRFWa8RjZ56NnoQdwCJaqI0r/eyhDWS7X51Rvnz8sakmlCG6glIUoEZFlGpOcIZElrF5awRnJelK2mN+/zLfD6wWHvkSZDtHZtM1vnKf+KjFlA1wiYZbjUA+RPycbxR1xSQ6E8GjNzbSnjMsbTAJFZw0yENpjzgpsIA3ZK/8ioBNRJusvlZcQXZkG4+m3T9OINk/fmUWALk+PF0nMneQ2CsUgH+S/lyFl5B8EVC6W960nPmIYWEs9VbtGW0vmEbWyvppjVI04Jpj+PjJaoDcE2qIzRJDeCpi0bpaDkDugj8bFdOnpqxfMPw/zGhJyuZZ6ZV1zGbgJ2pmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rwbha+idgLkB1T5tDkxQCYVHMus56qhZWJ2fGWztFSg=;
 b=wGI2RSOp1xDNx6diiiYHdVRsvd1x1P1TTwqrYW3rRAFLWjSO5KEXEavXIZzz4tItdDWDtELimp9ZtvyAzG28QVKVDIiePXgoEhMiSlcmKnwk4k8lt2zt5TSN05sF+OOg2GU4OVErR1h5N1P1Hb8z6mrM+tZ6Kmm4A0tCI9eHx1I=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1310.namprd22.prod.outlook.com (10.174.162.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 22:20:03 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 22:20:02 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 3/4] MIPS: cmdline: Remove redundant Kconfig defaults
Thread-Topic: [PATCH 3/4] MIPS: cmdline: Remove redundant Kconfig defaults
Thread-Index: AQHVfV1dKA/znw7xLEmQ9KKBLUDtWg==
Date:   Mon, 7 Oct 2019 22:20:02 +0000
Message-ID: <20191007221951.1889661-3-paul.burton@mips.com>
References: <20191007221951.1889661-1-paul.burton@mips.com>
In-Reply-To: <20191007221951.1889661-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:a03:100::36) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be9d9ee0-cb5d-4a13-c5c0-08d74b747fab
x-ms-traffictypediagnostic: MWHPR2201MB1310:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB131097EEC520CE670D0B23A7C19B0@MWHPR2201MB1310.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(366004)(346002)(39840400004)(136003)(189003)(199004)(1076003)(4326008)(8936002)(50226002)(186003)(44832011)(99286004)(102836004)(6506007)(6916009)(107886003)(76176011)(26005)(476003)(386003)(486006)(478600001)(305945005)(7736002)(25786009)(71200400001)(66556008)(2351001)(66946007)(66476007)(11346002)(71190400001)(66446008)(64756008)(81156014)(8676002)(2501003)(81166006)(5660300002)(446003)(36756003)(2616005)(66066001)(3846002)(316002)(256004)(2906002)(42882007)(52116002)(6436002)(6486002)(6512007)(14454004)(5640700003)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1310;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nChpxnjAILHGH3nPCJ6Hkfd7DAD3vRgxPdWegSanWLeJgGLGSsShEYdVVjq2VoiGv3HWjSNBteQJtp3dBDL5losbKbsxu9M0hYZFNoUri+DddVc+Fs9c8z+Qo5DgHvls9bbvaGS7aEO6vl2geaobWxJoqfJHXmXilmEpv2bOYyoGbQJa/UqmTzBBCdmtJiqCMdY72RZsglx9zmaeT0QNVndvIozty9DRdiavPAwAncLGNoKDogPRtDkFTGxudSYtSMtbPhk9HIQV5dmGQDIDz722EfyFHeR0mWhENOEDL18YCzWII7hMQyWnLfllZE5cpbUS8HJSvY2GVUY6powxZG31+hnjwdcQPfKJiKPq0kKxpCt8bPM+BdOu1EIFayTS2SenJ1E4VWfEjLk5ujtRJPxRdWOpYuQUBarzxunyrtc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be9d9ee0-cb5d-4a13-c5c0-08d74b747fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 22:20:02.9196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vlJbQ3+ZWq1D7R4EyJVabIw/tIFa2eqAdzTOJ2KvpsedfzcXnTq95NBpwtCZEVb7G7F8D+5WSrnJjoxykEbDsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1310
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CMDLINE, CMDLINE_BOOL & CMDLINE_FORCE all explicitly specify default
values that are the same as the default value for their respective types
anyway (ie. n for booleans, and the empty string for strings).

Remove the redundant defaults.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/Kconfig.debug | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
index 0c86b2a2adfc..93a2974d2ab7 100644
--- a/arch/mips/Kconfig.debug
+++ b/arch/mips/Kconfig.debug
@@ -32,7 +32,6 @@ config USE_GENERIC_EARLY_PRINTK_8250
=20
 config CMDLINE_BOOL
 	bool "Built-in kernel command line"
-	default n
 	help
 	  For most systems, it is firmware or second stage bootloader that
 	  by default specifies the kernel command line options.  However,
@@ -53,7 +52,6 @@ config CMDLINE_BOOL
 config CMDLINE
 	string "Default kernel command string"
 	depends on CMDLINE_BOOL
-	default ""
 	help
 	  On some platforms, there is currently no way for the boot loader to
 	  pass arguments to the kernel.  For these platforms, and for the cases
@@ -68,7 +66,6 @@ config CMDLINE
=20
 config CMDLINE_OVERRIDE
 	bool "Built-in command line overrides firmware arguments"
-	default n
 	depends on CMDLINE_BOOL
 	help
 	  By setting this option to 'Y' you will have your kernel ignore
--=20
2.23.0


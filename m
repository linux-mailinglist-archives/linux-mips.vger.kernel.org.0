Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A73CF6C1F9
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jul 2019 22:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbfGQUM0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jul 2019 16:12:26 -0400
Received: from mail-eopbgr750117.outbound.protection.outlook.com ([40.107.75.117]:15175
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727166AbfGQUM0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Jul 2019 16:12:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPrpjsmCoZX8ulMDxJ+z4NxKxC42zjk8Wu/FRYRvQM8R/qLTQqJ1mKskeI/lTKZLtXTxSVhitUbpm9NPtE5XqELrMcaE/ldF0hzjLTAU5xsij6NwkKpybqD5SyJRRj2/nEJs9uLdxeLBPAtitY3AjnTWLNk/Kyqzi3uZ8SEi3sChNBAcx1zLwY2ydRH6AAnYFMx1/FVvrrt+f1x8OeJuPaUU8TTlhI940n5B5xW73fmtIjR7mTG9kN4ihPHtKlXLFk7iAKTdI+K52HJgf6eU40X2LlqOC/EV+H0BfDiR8EsYbAY6MIjnlnWzc1tXVSTYlIrLsMqhJNG9tssNKWyniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSdFuk53wLxsCK1et+1SQZWu+5q5G/v2Ajfq8TZE/HA=;
 b=FTkWbbqSL1Y5bLzTET9Bh4jLsPx5Pms35HsQIfjokWP5sf21lYVq2OVQ+vyb1lXXzQTZqZLdJ2WDkz8Ctr1s4mVUnTODLVSYBgyfNi4ro9q/30Qsgz1z5jxEJjpoFtj/0gDUhPCQipBz2PKsoEPxBgthbV0ZZk974w6I+D4XEDd7adx+yQv4jnQ8GqV8W1foBJ7uDeiVokEJXRx01tZiV4U8vEgg+3YvXRKJzGfHdpDDOGF3HEgz/nJDzpgoktSZ92TCHfvP3pnvjZ3X7oMv04wzD+jjnM8+2gb+k2uO3LwCXUE5C4ekRDYoNKq4zi6R7qvjutHT2vJCIlG+EuYVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSdFuk53wLxsCK1et+1SQZWu+5q5G/v2Ajfq8TZE/HA=;
 b=Pn61K2gGZ8TmJr18xm5LNqP8TMwIZ0W2OJbHWbyB2uZK24F4OwqZ+Gse63Q+r3kLLPm9f3qaDucaDZmIDKHLJcHhwAyMa3i7zxl+wvdRvrbMIItSn8SZsLCRQfmb/pq83T66Nk08CsBSMCdwKplkqblLUvgvd4LCfZ87+96a/e8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1741.namprd22.prod.outlook.com (10.164.206.159) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 20:12:23 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e%5]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 20:12:23 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH] MIPS: Annotate fall-throughs in Cavium Octeon code
Thread-Topic: [PATCH] MIPS: Annotate fall-throughs in Cavium Octeon code
Thread-Index: AQHVPNvy4FFQV/ALgE2Z8yTenvwusg==
Date:   Wed, 17 Jul 2019 20:12:23 +0000
Message-ID: <20190717201159.23627-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5fd0bd4-72bc-4d45-216d-08d70af3146f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1741;
x-ms-traffictypediagnostic: MWHPR2201MB1741:
x-microsoft-antispam-prvs: <MWHPR2201MB17415CD37FB91EBF203065F7C1C90@MWHPR2201MB1741.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:392;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(366004)(136003)(396003)(376002)(346002)(199004)(189003)(66476007)(66946007)(66556008)(64756008)(66066001)(3846002)(6436002)(6486002)(6116002)(5640700003)(66446008)(25786009)(8676002)(1076003)(14454004)(476003)(2501003)(6916009)(68736007)(305945005)(36756003)(7736002)(71200400001)(2351001)(107886003)(71190400001)(256004)(186003)(4326008)(81156014)(52116002)(44832011)(2616005)(14444005)(81166006)(2906002)(50226002)(8936002)(99286004)(486006)(478600001)(6512007)(5660300002)(316002)(53936002)(42882007)(102836004)(386003)(6506007)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1741;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pJLHPuCMam2/t4q/9erJ+KCfQB+bayiu353PR3/gaqm4sKQbJa09/nAQ2haXfbA3kypw7VvfiT+D3nQbzYGb1kk9qiwOczEwmeycAmZYomv97OBij1M2xHHACVBwFJvxZJIWRkZjofyYbFzOduSk1S7xV1vJabG7lU3rIlAkkxWDYJ4Df9bktAMwedrCqF3dJbU8RiKdqPE0f4j/QMlZ9zCkV0+CxZ/SuOOObjN07Iymyl5wd5lHf9+ToLlQ17bSYT8dkFr1dI3/vlwMaTnN1kUPjQapscI7IEzCmWk9gWYwoB1a15BgTBIjt2XMtNE7/wMMO7Gj+YRBQDMSE9XwNXbPigUPuRDzk2pwS984rRgHqazgP0KxyW7OmovM8pOuyimj7DJkuPb8bieSniROrFRuP6r55ZUk6RFZcJ7sIQA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fd0bd4-72bc-4d45-216d-08d70af3146f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 20:12:23.4614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1741
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are a couple of intentional switch case fall-throughs in Cavium
Octeon code, which trigger compile errors with -Wimplicit-fallthrough
due to -Werror being enabled for arch/mips.

These can be encountered when building cavium_octeon_defconfig.

Fix the build issues by annotating the intentional fall-throughs.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/cavium-octeon/executive/cvmx-pko.c | 2 +-
 arch/mips/cavium-octeon/octeon-usb.c         | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-pko.c b/arch/mips/caviu=
m-octeon/executive/cvmx-pko.c
index 676fab50dd2b..c2a97b62742b 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-pko.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-pko.c
@@ -485,11 +485,11 @@ cvmx_pko_status_t cvmx_pko_config_port(uint64_t port,=
 uint64_t base_queue,
 			config.s.qos_mask =3D 0xff;
 			break;
 		case CVMX_PKO_QUEUE_STATIC_PRIORITY:
-			/* Pass 1 will fall through to the error case */
 			if (!cvmx_octeon_is_pass1()) {
 				config.s.qos_mask =3D 0xff;
 				break;
 			}
+			/* fall through - pass 1 hits the error case */
 		default:
 			cvmx_dprintf("ERROR: cvmx_pko_config_port: Invalid "
 				     "priority %llu\n",
diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon=
/octeon-usb.c
index 1f730ded5224..cc88a08bc1f7 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -398,6 +398,7 @@ static int dwc3_octeon_clocks_start(struct device *dev,=
 u64 base)
 	default:
 		dev_err(dev, "Invalid ref_clk %u, using 100000000 instead\n",
 			clock_rate);
+		/* fall through */
 	case 100000000:
 		mpll_mul =3D 0x19;
 		if (ref_clk_sel < 2)
--=20
2.22.0


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F53B6C1B3
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jul 2019 21:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbfGQTtP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jul 2019 15:49:15 -0400
Received: from mail-eopbgr810125.outbound.protection.outlook.com ([40.107.81.125]:40707
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726598AbfGQTtP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Jul 2019 15:49:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3vBXfm2gZAcrw4AniKzDdIM2/68gPmiH1NIXyc6WIKNH6b62DjV6yNXaz4ih9bSRY+nHfW3NhFbt3YVLjBy8ylK4BqX/qdb8t7rKahA2RrSrBIybkz/5NikoD4mlMx2X9j2Bws6N3DD4/OcPJKuf2FxHXtXj/sA0tM7AAEghsNtguB0uCp+brvSINwd76cna3tX66/4rLvbSxux19qxGVsPLqbe+OnysuSJIsWowcPQEcQviJwqnc8Pk8b5mddyS4rkRkVs2fLjhxG0mCXUyhAt1T4CppBkxw0TFmhgSdhZp+RvLd592iwmAPvy+wfBiZSSfgujpFzVvteGbtJaEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptPwRS38FubpN2e69QoCBKTL/+Rq6P0LKvqMkjBu6t0=;
 b=bDojEz2GWZuXE3nM8KqvyDjb9vVPoZt1auZwcoUGpyCGw/EYUcWvbsnnP7ROuoXfSbA9oLrV/W5/XeKcB9rp13TEJTd6rLgEdU/kwFF4QCNvudkwqfd3QED4sa9PooGpBuyUlHtdzVyDOu4pagA31PdgUVVjJQpohx14s5DwNRnP4YvZLxcMHNC8PsnHqT32Xq8qgOHIG1RK+oslq3moLFlJGUBOAQLyetC4cTuQchHIb3RvhLaS3LtL0s9oE2ZoQgYFMvA5WgkJ7bKRLBDsuac0m0gzuHh7wjlWq7G+MG38qBVnFV83CGZADTFVanByYe0Y7DzjzBvV3T45NB10jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptPwRS38FubpN2e69QoCBKTL/+Rq6P0LKvqMkjBu6t0=;
 b=H8vbR0k1P+MX59eV2kKOzKdEY7heqND0lEghqgUmikTlbhB/gn8puJz/I/cNz6DuKzqZ0VHO4oZnFsnKNJaJXoeBzREjcM3Q7uqxTOnxL+HGCH2gBM3pX4RtILr51W+W0YHcbBn5c1d3enODtz/K9zAwBPuUZWpyfijL8q5xjFM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1358.namprd22.prod.outlook.com (10.174.161.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 19:49:11 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e%5]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 19:49:11 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH] MIPS: Annotate fall-through in kvm/emulate.c
Thread-Topic: [PATCH] MIPS: Annotate fall-through in kvm/emulate.c
Thread-Index: AQHVPNi0ApY7UI34VEGA1VC3MClUFw==
Date:   Wed, 17 Jul 2019 19:49:10 +0000
Message-ID: <20190717194900.30143-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0059.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::36) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3c04156-1335-488a-9194-08d70aefd65e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1358;
x-ms-traffictypediagnostic: MWHPR2201MB1358:
x-microsoft-antispam-prvs: <MWHPR2201MB1358D3AE2CE875782801969EC1C90@MWHPR2201MB1358.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(376002)(346002)(366004)(396003)(136003)(189003)(199004)(476003)(7736002)(2501003)(44832011)(305945005)(102836004)(8676002)(3846002)(486006)(6512007)(25786009)(4744005)(14454004)(71190400001)(66066001)(71200400001)(6116002)(1076003)(256004)(186003)(26005)(316002)(6916009)(2616005)(386003)(64756008)(66446008)(6436002)(66476007)(6486002)(5640700003)(52116002)(68736007)(66556008)(66946007)(2351001)(478600001)(99286004)(5660300002)(50226002)(53936002)(2906002)(81166006)(81156014)(42882007)(36756003)(6506007)(4326008)(8936002)(107886003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1358;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hOnWS8IiKQlKL9ckohzyccZNiz+MjMXkMvYXXZNUEqO3nsm8ks2eSusqCb9n44Tf90UUxaoyF6oicykfrV1j9qUTk4ATfHrPmA+fzJ4ErmVv+qbwiFt3n/9Flv9mAGNgyZdMef2mYyoUhIjq3rqeFRbeXdsDlmqpZ+B5c09jq3Z4U6VEPYjoGqW2jNG8ivAlL3oca82wRRTVndax8DMxPC3bXjlCN8zzghTFktxpnKfivZ3DU+B02xIzRvGMjYVwM8F3VaEpGfFsAvRnDvNeJwfNYDCNDPY0rs6DtVdQJNgtJBsd/Js5AnW27yXl08DL4+X3IptfObixuqzTcesscSoPhoZHsJp6DYMI7Wd/UY7+g9MClekDoA3l/yb25JBJKDp1URCmDeFq81nmyBQ8gAoAQAaarP1xkzPYYgyF5ZY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c04156-1335-488a-9194-08d70aefd65e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 19:49:10.9280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1358
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

kvm_compute_return_epc contains a switch statement with an intentional
fall-through from a case handling jal (jump and link) instructions to
one handling j (jump) instructions. With -Wimplicit-fallthrough this
triggers a compile error (due to -Werror being enabled for arch/mips).

This can be reproduced using malta_kvm_defconfig.

Fix this by annotating the intentional fall-through.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/kvm/emulate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index e5de6bac8197..754094b40a75 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -140,6 +140,7 @@ static int kvm_compute_return_epc(struct kvm_vcpu *vcpu=
, unsigned long instpc,
 		/* These are unconditional and in j_format. */
 	case jal_op:
 		arch->gprs[31] =3D instpc + 8;
+		/* fall through */
 	case j_op:
 		epc +=3D 4;
 		epc >>=3D 28;
--=20
2.22.0


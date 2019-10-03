Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F554CB202
	for <lists+linux-mips@lfdr.de>; Fri,  4 Oct 2019 00:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730028AbfJCWqj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Oct 2019 18:46:39 -0400
Received: from mail-eopbgr790103.outbound.protection.outlook.com ([40.107.79.103]:49134
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726780AbfJCWqi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Oct 2019 18:46:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ij07x/ppFWwifrvpT2PEd7WuNG0ktNc3vciHKMb0UlnrnP6uLCJfYo8arceCI/rnhQtLS40DfLDNbxaWD78o2ad+m67QKgW6z6cn5suTjeVvAIbDYBcOs7+9RdXNThs+ieG9ZpF11cjpcNymQSCcHGyHTo0+vILg9by5xcXP2fdYqW9/X2Z1bZybUv140edJ/2ENNniq2L1xnIa0a/+xicCFkJX9imihlqj5wqCQWn746j5F6GiIDZEuMkX7aMiuJF3P4hOrfYUJKqRRcqwS8ImumG2DxXhw8k7vC1bET1eX8Tp19QWx2Ivgv+jaB+4NkjQsmZVvWc5y7ddbibFXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0T6nqLvfUzrhmF/ooWKTU1bgjKZD44TrYLPrDkw83lk=;
 b=LgKlt5b0SKJUezr2SH9qNL1Q/oAAJVC2gksCLetU+Eb7pAE+XPtinsJ2evAu8dAIav/Xe4efbbdzm5J8XLqHJzFBOotTOn30TcDCxL5CrPCqFi2FF+MO6IiRaRC1CnZeD0amYPJCnVnWuGUskt6SgJ63l1pt2bYz/3acuVUEfG01St+iem0gl7r1DdcEx0cY2zJFYArR7/CyVHWdjfeFdSvHks3fLQGcuEirALa1frGx+1CHg8ulI3P2Ye+QGXK3KX2U3SCVS6ZPh5FC1kFjNx5moXbzA0VZMDt7vnMCmMl6WjBMpzTCaOxTmhqvE4A5dZ/lmG+FP1KbD8fPLTkX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0T6nqLvfUzrhmF/ooWKTU1bgjKZD44TrYLPrDkw83lk=;
 b=nIjVklLaoobZPb1AyI3X+p3CTC1dSqaHlwq/OJeoYOVJ0heSO5QWF/1hWOqz67FWOGtKTE/UUbG3XtQ4x4aJZ8MgN/DFime+tJeOL1F1z+8hnBGvGN1g4w+P9sUVgaLaV9JRUnSUd2LvYzta/dnNqJsdYqOunvWwt3qbyoZX/Og=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1261.namprd22.prod.outlook.com (10.172.60.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 22:46:37 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 22:46:37 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] MIPS: pmcs-msp71xx: Remove unused addr variable
Thread-Topic: [PATCH 2/2] MIPS: pmcs-msp71xx: Remove unused addr variable
Thread-Index: AQHVejxptiI51WsN0ECGKZkkiZGz4A==
Date:   Thu, 3 Oct 2019 22:46:36 +0000
Message-ID: <20191003224611.727276-2-paul.burton@mips.com>
References: <20191003224611.727276-1-paul.burton@mips.com>
In-Reply-To: <20191003224611.727276-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:180::27) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f103aa01-9707-4e2b-cf85-08d748538c1a
x-ms-traffictypediagnostic: MWHPR2201MB1261:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB126107522B1CC58DD515052DC19F0@MWHPR2201MB1261.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:374;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(366004)(376002)(396003)(346002)(136003)(189003)(199004)(42882007)(26005)(54906003)(316002)(66066001)(25786009)(36756003)(2501003)(186003)(81166006)(81156014)(8676002)(8936002)(6116002)(50226002)(76176011)(99286004)(52116002)(2906002)(14444005)(6506007)(256004)(486006)(7736002)(305945005)(11346002)(476003)(2616005)(71200400001)(3846002)(5640700003)(6916009)(71190400001)(44832011)(4744005)(14454004)(5660300002)(64756008)(478600001)(66476007)(1076003)(2351001)(66556008)(4326008)(66446008)(102836004)(446003)(6512007)(6486002)(66946007)(386003)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1261;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X4PI5TiIlzQOC1y9S16bm/4o4n+Q3YLz5vFlOgX5338xDJh7V1DitoUXDweDaDM5UbhIAugZ6Jn5wQftR2uTMz6MfXYNCzbuuMQVTeJQ46jIcEhtGliLtZuhF/H0ut1T0cJzb8FguvMe3JpoQfQuGbOMZmUJgxwOZgCQd/z1l2GcsQluw3NANYIjjRm7sy83n+37ZauYWJ64hSVcD/JTPm9qdmjAvr/Qg8TOB6PAKGzHyEfaLdFZqHu+jFZUTlMOoPidaO2Gdv+WPAoeDUdQc1JlW3GOjtrR4p8U3S5jTKs7v0iC0zjV0jww9vFA3NWVp1zF5P8/1vJOq/fsFpv6ddPSgt6Q/LOKMiXAOAHKu56qGPrt5Haixm/kkxz3MQFCjqsd8yilvQ++5+x2qj9M+ZBNOLNorZNby0lECC//ip8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f103aa01-9707-4e2b-cf85-08d748538c1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 22:46:36.9315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CMYEI8PkxO4vKuzVAjOJcP9JKDJHKgQCeJyMCWrdXqNTi1nXWp96+6LnCA1KE+1Jqzf5hrLnTjn9D5ExGGeQgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1261
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The addr variable in prom_free_prom_memory() has been unused since
commit b3c948e2c00f ("MIPS: msp: Record prom memory"), causing a warning
& build failure due to -Werror. Remove the unused variable.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: b3c948e2c00f ("MIPS: msp: Record prom memory")
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
---

 arch/mips/pmcs-msp71xx/msp_prom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/pmcs-msp71xx/msp_prom.c b/arch/mips/pmcs-msp71xx/msp=
_prom.c
index f87c522a63e6..800a21b8b8b0 100644
--- a/arch/mips/pmcs-msp71xx/msp_prom.c
+++ b/arch/mips/pmcs-msp71xx/msp_prom.c
@@ -378,7 +378,6 @@ void __init prom_free_prom_memory(void)
 	char	*ptr;
 	int	len =3D 0;
 	int	i;
-	unsigned long addr;
=20
 	/*
 	 * preserve environment variables and command line from pmon/bbload
--=20
2.23.0


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4F03D527C
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 22:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729563AbfJLUnk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 16:43:40 -0400
Received: from mail-eopbgr740101.outbound.protection.outlook.com ([40.107.74.101]:53632
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729432AbfJLUnj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 12 Oct 2019 16:43:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwYM6WXS7BWTRW5n1IRR6uEh397XoLWzGMzi2m2uDnVGicX7hMSw8wrB0DimDL9uzIwKomdXoCqAwuqZn4XOZCsJXdxazJDwQUxM8c6k6F39SNXm2p73Qd2RNAAr09J42dM023Pe9s9rnTp5k909mgwn4WTHKzKLzzTrp+DktAfWgAWbED+Tbj3hFEhavhjJ8BQ8hLIkMSQj4bnqQFsdM6zAxyyS4yr+55wYGzRnXZ+if0hpsHdQvn5zC3H8uhKpbTDwiDl/AbwbsJFrM4oQrYBPlr7XYLaMukbFf+r3pn0x4beEBB4Fe0r5hLjPBJMN19X2WEfplt6RvMcPCW0jwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5sudP7ea20s+qVO30X1cE2JvR0EAHMh+gU8lADVars=;
 b=FNkmeYgIj/nLrJUQO8DIM2lLuWn2ZTLomVvJNFhbkweQ5TVDYIZMtZSHWPiDtR2hCEdRowhHRERaH8dvZFlWIgdWYEZM9v6oumnnC6pcrYSMf+GePSpjXPB7iVvmEF7G5228Trzxle9bbBCdK0OCNXe5/Kd6kAbL0f1jcKdY6MbhGqi7K6adjn67z1D9zMKWaFbQ7MtshQZEH9Y1pwbYCifeCIh17rTlrnqMddrkcirvhyr7ojm54mGwj6uawkNH38VBlRb9oz1qGLX6lq7xU3Isf8qXG4ta0vLAJnWqREmyH0L9xeVHiz7KUPIKjmiDR6FOPIZhGQwSRquwSJ7l5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5sudP7ea20s+qVO30X1cE2JvR0EAHMh+gU8lADVars=;
 b=Nlb8iXv+/WMfOHiE3281n9ep7k5ONrgaHG5vVpHtupJV6MI8C6pYrqn7fjYivDDim8Im8i9+kDX37o7MKQDNq1KIpmiqRaTxy7BFmNdgWS5UJ2lHbmVzCYE0dMCR/Uy36WPQcKS5f66uy9Qq1Hce/XJdkUiBJu6cWUteXA43yOU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1536.namprd22.prod.outlook.com (10.174.170.161) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Sat, 12 Oct 2019 20:43:37 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.021; Sat, 12 Oct 2019
 20:43:37 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH 2/3] MIPS: Fix CONFIG_OF_EARLY_FLATTREE=n builds
Thread-Topic: [PATCH 2/3] MIPS: Fix CONFIG_OF_EARLY_FLATTREE=n builds
Thread-Index: AQHVgT24liWPWOQHqkCXhN4EuapzCg==
Date:   Sat, 12 Oct 2019 20:43:37 +0000
Message-ID: <20191012204326.2564623-2-paul.burton@mips.com>
References: <20191012204326.2564623-1-paul.burton@mips.com>
In-Reply-To: <20191012204326.2564623-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:a03:54::27) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36d6de62-a12c-4fed-6fbd-08d74f54db27
x-ms-traffictypediagnostic: MWHPR2201MB1536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB15369BF80630BEB66733B857C1960@MWHPR2201MB1536.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:89;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(366004)(136003)(39840400004)(199004)(189003)(25786009)(71190400001)(2351001)(71200400001)(36756003)(256004)(305945005)(6916009)(14454004)(478600001)(4326008)(6116002)(7736002)(1076003)(99286004)(81166006)(81156014)(8676002)(46003)(446003)(316002)(11346002)(5640700003)(42882007)(2616005)(52116002)(8936002)(50226002)(476003)(76176011)(186003)(102836004)(54906003)(6506007)(386003)(6486002)(2906002)(6436002)(66476007)(66446008)(486006)(66946007)(64756008)(44832011)(2501003)(66556008)(5660300002)(6512007);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1536;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lDubhBXG504qNp3RlscTVYdpoCEV3E3dnqKY/JJNYowKzMuR8xxU46iNms0AZ1fsBK30MNLZzVX7NjTMhWyhl4SBMD1HmCI5vHVGtSCkfKI8gdnTihwOZuZir7hlo5yConRsm/lc7xeOGiKk3Vfg59tQSRPXdveDF0sd0aidwUvEwBcLMPlBH7eiaTSA0ak1sSIqniqefYUKZwZXAUvuZ1zKJkGmT1ymeQan+ZHOwCAmFa13Y8PRMZEK17Z32aM26RFJsvKv5tY+/oA94FCQQlAJVMAI9DhLJ7ijpiDDwGJ9cr8T4eOOVn4yHjUKJeKfjWqJ1E4waFpotWKyFzfA8Q4s83LhgT8PHQ1nmdQxWZjL5TjUXBFZwQSoxqgtXh64wKliq27gmEIXdh+408sVKDrGalzIXFJCkG7M3ayta90=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d6de62-a12c-4fed-6fbd-08d74f54db27
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 20:43:37.1955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Up6ASVGL8LpGONVVo3wP7bckZzWhp5mjne893wBsJdgcyqmjpsUpVnYWLcsb8FszquD9dzmuikeFebQC9iQizQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1536
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Configurations with CONFIG_OF_EARLY_FLATTREE=3Dn fail to build since
commit 7784cac69735 ("MIPS: cmdline: Clean up boot_command_line
initialization") because of_scan_flat_dt() & of_scan_flat_dt() are not
defined in these configurations. Fix this by #ifdef'ing the affected
code...

Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: 7784cac69735 ("MIPS: cmdline: Clean up boot_command_line initializat=
ion")
Reported-by: kbuild test robot <lkp@intel.com>
---

 arch/mips/kernel/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 119999d31558..7ccc8a9e1bfe 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -551,6 +551,8 @@ static void __init bootcmdline_append(const char *s, si=
ze_t max)
 	strlcat(boot_command_line, s, max);
 }
=20
+#ifdef CONFIG_OF_EARLY_FLATTREE
+
 static int __init bootcmdline_scan_chosen(unsigned long node, const char *=
uname,
 					  int depth, void *data)
 {
@@ -571,6 +573,8 @@ static int __init bootcmdline_scan_chosen(unsigned long=
 node, const char *uname,
 	return 1;
 }
=20
+#endif /* CONFIG_OF_EARLY_FLATTREE */
+
 static void __init bootcmdline_init(char **cmdline_p)
 {
 	bool dt_bootargs =3D false;
@@ -597,12 +601,14 @@ static void __init bootcmdline_init(char **cmdline_p)
 	else
 		boot_command_line[0] =3D 0;
=20
+#ifdef CONFIG_OF_EARLY_FLATTREE
 	/*
 	 * If we're configured to take boot arguments from DT, look for those
 	 * now.
 	 */
 	if (IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB))
 		of_scan_flat_dt(bootcmdline_scan_chosen, &dt_bootargs);
+#endif
=20
 	/*
 	 * If we didn't get any arguments from DT (regardless of whether that's
--=20
2.23.0


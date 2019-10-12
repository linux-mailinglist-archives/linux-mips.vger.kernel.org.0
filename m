Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D23A1D527E
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 22:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729516AbfJLUnn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 16:43:43 -0400
Received: from mail-eopbgr740101.outbound.protection.outlook.com ([40.107.74.101]:53632
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729432AbfJLUnn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 12 Oct 2019 16:43:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMy5RahR0oOSQfah4t017TuKF7yNXvCQzTog1to3s2h/RrdnPI6neJGs6VZsotC6HCGcCQduTmtBykgtUvKbbW7MsNmn31947s6OqCaDKz1TQTgVWIGGTPqF8g/ky6YK3QTykC5CP/zQgtIKN7zo+nprO0ocvZPfhXwA0rOGhhhqHE3OGH/+S7+F1U2YezU98CVmvGYcpwoMgo9IPJAYaCoKmBsBQ0yxb8HiKodLqbY29FOTxWr45C3ChP/Kp1zBFvabiyXkC1Uu+tgxshPPhAD/+XzsbuNwq/7DAH+Fc12OTJAhJ8IK8m+c2JrCOFD747AYhv5ECd9Owuo4M/W68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wy+XJkD5468na4b2QAHn5LoazFNJuvrOQEbOsugHHWI=;
 b=FcRR1xtLlpR99ygHflp/zCacpGaRyR2HVtfw7uT8YaNTNVejacbrkZWl5W8PyFi2Y7XJCWTuYXpRLZMEO4E2UW6/CM/sfl551o0eP1K0h7MhZSlpb+0k70TrCfjob9Qh5AnMdTEUWX7VqA12QYDcX+/XLcnliBS+uDMBfW3DWi2PTJbbQY1uPJdOWLu6LwiLCyWCwfr1JxDfxQUD3oMCMBuNzfp+/EQ4ZuUMmxZ5EZWWcEM5PkilltcxepPLUejQsW4xaPxPoOOrA9ti1uLHCtSGO4cyJ58d78wPalKYaYquwBV0r2HM3YvUO7ErfuZVL8zkGyJLa0rFo0AkRGyLNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wy+XJkD5468na4b2QAHn5LoazFNJuvrOQEbOsugHHWI=;
 b=j4hO+ICGMOHC0Ifz2XXStJStPrfchYEsaMCd63DWlStJZ1bAYFzmqp8fG923B5QxuyOyOGAu3cTUzplYMIvNf0VYo/7u1mdlepG0rJkV7PmnidTGcYKFT2ImRuJV7vXR4zR3zk7FgD97OyiEFHa0Z7GLt7DGAnx2NuJfw6rA8C8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1536.namprd22.prod.outlook.com (10.174.170.161) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Sat, 12 Oct 2019 20:43:38 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.021; Sat, 12 Oct 2019
 20:43:38 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 3/3] MIPS: Make builtin_cmdline const & variable length
Thread-Topic: [PATCH 3/3] MIPS: Make builtin_cmdline const & variable length
Thread-Index: AQHVgT255dhw8QW2Vki5iYc5OdbMNA==
Date:   Sat, 12 Oct 2019 20:43:38 +0000
Message-ID: <20191012204326.2564623-3-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: f9a4a6da-946f-4ebe-d187-08d74f54dbb4
x-ms-traffictypediagnostic: MWHPR2201MB1536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB153679C68F00569D204A517FC1960@MWHPR2201MB1536.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(366004)(136003)(39840400004)(199004)(189003)(52314003)(25786009)(71190400001)(2351001)(71200400001)(14444005)(36756003)(256004)(305945005)(6916009)(107886003)(14454004)(478600001)(4326008)(6116002)(7736002)(1076003)(99286004)(81166006)(81156014)(8676002)(46003)(446003)(316002)(11346002)(5640700003)(42882007)(2616005)(52116002)(8936002)(50226002)(476003)(76176011)(186003)(102836004)(6506007)(386003)(6486002)(2906002)(6436002)(66476007)(66446008)(486006)(66946007)(64756008)(44832011)(2501003)(66556008)(5660300002)(6512007);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1536;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fUx6EkxyE0NfJsfUH61I0/NpsOHyh5gzt1ocn8yHmth99l5aMbk/du9QC23TqmjD1uxoKTEVx0BlIFTauFPnsUG1USjZTSa3WhTOveZ9SYKhTZ2F5jbnUqWOTRFAprF81FSVjaqLTY6B3f6dNWZLdjuijD1VO8cTyFV6vUHP51qqj+6iSbUf/GcoCu9vJw04HHRLAVAAhrsXXh1pMcSSsDvLsqtFeTB+zTCh7fP2Ss63mb6QMzLjTesrkH/x9wO8JRcXBYVQCKHZe/oy+n4/2nMKRk4JXhtIdPEpY1QtgTO3B0M/NW4lEH0SlY4HgDk/toogC4cn5ArPmzrXBvmSPiG2WnV9O70oJtjZOruV65q0yk96YMQbj7MkCV6UyqNXA2YM+hr1iMXxl9xoAj0cLMHZEEzP9wtMn/7UBn7URJw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a4a6da-946f-4ebe-d187-08d74f54dbb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 20:43:38.1640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s3xoTTeauxICNMA/rPSSHRtVfjwzGL6TYvfdjs7KzI8b4FUPSWTA9XlkLwAlyyM/UJjR1rjK7af+i9/ei4oIUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1536
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We have no need for the builtin_cmdline array to be fixed at the length
of COMMAND_LINE_SIZE - we'll only copy out the string it contains up to
its NULL terminator anyway, and cap the size at COMMAND_LINE_SIZE when
copying into or concatenating with boot_command_line.

The string value is also constant, so we can declare it as such to place
it in the .init.rodata section.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 7ccc8a9e1bfe..2af05879772f 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -67,7 +67,7 @@ static char __initdata command_line[COMMAND_LINE_SIZE];
 char __initdata arcs_cmdline[COMMAND_LINE_SIZE];
=20
 #ifdef CONFIG_CMDLINE_BOOL
-static char __initdata builtin_cmdline[COMMAND_LINE_SIZE] =3D CONFIG_CMDLI=
NE;
+static const char builtin_cmdline[] __initconst =3D CONFIG_CMDLINE;
 #else
 static const char builtin_cmdline[] __initconst =3D "";
 #endif
--=20
2.23.0


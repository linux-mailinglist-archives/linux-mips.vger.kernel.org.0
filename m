Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB10FE8CE
	for <lists+linux-mips@lfdr.de>; Sat, 16 Nov 2019 00:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbfKOXox (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Nov 2019 18:44:53 -0500
Received: from mail-eopbgr680110.outbound.protection.outlook.com ([40.107.68.110]:21861
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727171AbfKOXow (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Nov 2019 18:44:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdEc0Wxi3h7w6zpFwOJPygEIA3fwnOvdw3qWoYFGIvJWpr7Qnw2SvJMrHnEXfvoo+uQ7omuPPFszGJhP3ENU0a0XjM6S8P6ASD3aHVkLe9837iBxiNoJ061zqqZ/6fqtG/ut1vhkOHfUBAo+6UeeLGyIwCAjnkYXOZmfA+E2eXbFt5p4D6Rmx1Y0twf7RDhXXpSpoB4iW4OATzbGRUMAC9l+i4w63qgLw7Rw4PDfCw3J1bLcGGZLB+PZyger3B4TWNaBYsJMWOgozdl6FhvqGnHs7rHxLWuzksVb9dcBJuLt3BQZaQXYvnrTerG310dXTw+Z6SapHT0szOBgLnwS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Et7uAzkU3ngaRZ3jbxcAG0Vw/O7L9IUsLzS24re5JQ0=;
 b=PGO31PyOauq08OZM3cwppEZtoPiRR5njf2gEpssF4QKFDTgvLFOPAYCONQoWrbtc4rx5exhUyZNtNh2znV+7ePlc6hdymNo8ag4TZrkgkeABkiJrFdlMq1zNcW9pXn2VC3LHir2XnTfGgFF+3PX4a+3pwODQUIG9tyNWZ/BaqpOikwLXr5iU0oHJ1wjgyIvWgstL0nBL6MwSdn3PoeDfF8JJovr4AefswQqm9G3ew5gvRBBEe9rHPhsGmtdle6LoXrJVmHSsekIpHnrpX4FXWA8a97I5W0Vv0eC3U6xrCUWy+AlwUTJAZojnk8B26NMPxkLiNUa0pQ9TC/7M5TweFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=wavecomp.com;
 dkim=pass header.d=wavecomp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Et7uAzkU3ngaRZ3jbxcAG0Vw/O7L9IUsLzS24re5JQ0=;
 b=imv3Y7hN2/L61vuPXzUNiTy2XP32jD3aBRDYOrp4XQuRmVhkfuWHu/ylII9frVVedrd91FWimMEDtmCr/E0WQyyfyC0CYx+/RjQ9apB9c21T8ZJxkytFXsm4nsB+DQ7mrBQNRHlnrtb7WpOtZauSTfkbGjXl8nof/nyn4kAAFfc=
Received: from CY4PR2201MB1349.namprd22.prod.outlook.com (10.171.209.23) by
 CY4PR2201MB1285.namprd22.prod.outlook.com (10.171.211.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Fri, 15 Nov 2019 23:44:49 +0000
Received: from CY4PR2201MB1349.namprd22.prod.outlook.com
 ([fe80::a909:cf85:c0fd:f6f1]) by CY4PR2201MB1349.namprd22.prod.outlook.com
 ([fe80::a909:cf85:c0fd:f6f1%10]) with mapi id 15.20.2451.027; Fri, 15 Nov
 2019 23:44:49 +0000
From:   Hassan Naveed <hnaveed@wavecomp.com>
CC:     "paulburton@kernel.org" <paulburton@kernel.org>,
        Hassan Naveed <hnaveed@wavecomp.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Yury Norov <ynorov@caviumnetworks.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: [PATCH v2 2/2] tracing: enable syscall optimization for MIPS
Thread-Topic: [PATCH v2 2/2] tracing: enable syscall optimization for MIPS
Thread-Index: AQHVnA6rS9HJl3kZHkGjOV6iCG/7Yw==
Date:   Fri, 15 Nov 2019 23:44:49 +0000
Message-ID: <20191115234314.21599-2-hnaveed@wavecomp.com>
References: <20191022174551.2fcc85fd@gandalf.local.home>
In-Reply-To: <20191022174551.2fcc85fd@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0101.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::42) To CY4PR2201MB1349.namprd22.prod.outlook.com
 (2603:10b6:910:64::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hnaveed@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [4.15.122.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 001ea042-787e-4217-54fe-08d76a25cd75
x-ms-traffictypediagnostic: CY4PR2201MB1285:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR2201MB1285E35FC2BBED828564574ED4700@CY4PR2201MB1285.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 02229A4115
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(376002)(346002)(366004)(136003)(199004)(189003)(316002)(11346002)(14454004)(14444005)(76176011)(4744005)(256004)(1076003)(81156014)(6486002)(8936002)(8676002)(81166006)(386003)(26005)(99286004)(6506007)(6512007)(2906002)(6436002)(5660300002)(1671002)(102836004)(478600001)(86362001)(71200400001)(71190400001)(486006)(66946007)(66476007)(66556008)(64756008)(25786009)(3846002)(186003)(66066001)(66446008)(36756003)(6116002)(476003)(109986005)(7736002)(4326008)(50226002)(54906003)(7416002)(52116002)(446003)(305945005)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1285;H:CY4PR2201MB1349.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9l0Po2v7C4QWPyW56/sMYmacj6JLrqy/EH5roGtfyZt583IIwRvRMTZoCuZmTx/l0w/9CvVD2CDQaoiR3say4e6R4TdoC38mIbJExrhD/bIqEXNf9/8L0zUig3TosghndipZ0XKVjvgBVM2tvMR1fBHNEFShfMnmFJPHgRD3ovsufUh4ecjQombM4SzsmUOhA7rudn9/ybNRn0FFhRqAIkVXyTzQIWVe4BmJGJIhkUD2rsgYTdAFyH0dxDx2BJ8cGQnS7pt+6PqOfoS+BsnYKPXWOojPQ7LnqrIa7LH4XCTY1WOi4HmyydW2Kx0opk3Dj5VDJPG+z7tsukuqtf+KtKxQaCh1gLgXDHPpSss2BeNriF5KHF0c9eo9mGetThhJMVabHjYdmoB5AHZynrTOeSRRDVzZyAn76y98z+B1hRR7/mjMPaOx3yklcuDW6Zdt
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001ea042-787e-4217-54fe-08d76a25cd75
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2019 23:44:49.1956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j31tICMTxdTZ6csRBwonrlLP+pa/TzoUWDaa1JqsE4qxRNfHoircHPO3i/Ldf/r5p0ZoF8xiO9zWLyDETBmqZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1285
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since MIPS architecture has a sparse syscall array, select the
HAVE_SPARSE_SYSCALL_NR to save space.

Signed-off-by: Hassan Naveed <hnaveed@wavecomp.com>
Reviewed-by: Paul Burton <paulburton@kernel.org>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4a5f5b0ee9a9..32421ecff933 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -71,6 +71,7 @@ config MIPS
 	select HAVE_PERF_EVENTS
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
+	select HAVE_SPARSE_SYSCALL_NR
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING_GEN if 64BIT || !SMP
--=20
2.17.1


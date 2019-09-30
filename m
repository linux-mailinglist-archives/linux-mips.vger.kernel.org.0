Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81077C2A83
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732819AbfI3XJe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:09:34 -0400
Received: from mail-eopbgr820129.outbound.protection.outlook.com ([40.107.82.129]:60959
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732787AbfI3XJ0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:09:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOgds0mTk0ld5ZDXsVq4VTxByEigmvpOecNvBC46lrbVxgqBuaznnEXw8V72hOwzYYd9aKFeH9qfzP19vVG261h8jN1/7u+1VvAhkmc4QUezlH7hZwg3KHcxeJqSgQdZN6rOC5NfIK9zjFK61+3mW0LywlqAFNIHmyJckOie4nzbSLSfRuibgbMzAD7ZUEUr0W/zCxIiq7AMVzV+3LI5NGs4VwFul7ERVaVUrzx0EwKnhYmVCqQbPiqUCpPuJpnfsOhbYGbNAFkE74kGb/W7atDP+iP/c+nfKbx6MNqm2dteyPV659Tu3A1YmvCyteR+Uz+jxSB81EY1jreNYYnnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nYZ8yzbRJyMVxKdFTwZuVNLM2h93JOjnEbl3tT51wM=;
 b=AtzP0d3YnRcgDJGyxxmvFeoLute9bjAezqpsyOKAqf13KMODy0OC9zv/zt2FQ4kZu4KDTrZtQU4oeCuA8D8l8qtPqG1qHw3FrGdKHd2GH4o2oR7pmVECypzssH2UY6791FaAWQvJfGJ9+K6JhqonVIvCk1xsqH2sw5NwdNGOw4TvrUgz34ZhELGtLNU1DbT57iVqOq81Z6/locQ/WGzUB3Kj1lWTYcYgyMUXa6aJHGe7iOurnm3vSojngarRJTer+019o+hGDt1Dx7TXixGiC0K1DalAW9QSEvUAVY+EQe0lvbqryhBe8ZKsJN71ofXr1+RPytwHiJsh8yb+i5qXBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nYZ8yzbRJyMVxKdFTwZuVNLM2h93JOjnEbl3tT51wM=;
 b=qzAkb6hrIA5giqfZ7QODbvUHTaM7WmfklzqHbmlKvL4yEAgLqbF0TStccyTSjavCtB7sNpuL+zxz0USrjPZPOxlxgAGAPUxCGZttOY/tmocHe+oFKqR7J7+YPGPhFxuG5tfa6HVtkwqzX2LoidzIFil+2x+RQq4pCumFhELOxp4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:09:13 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:09:13 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 36/37] MIPS: genex: Don't reload address unnecessarily
Thread-Topic: [PATCH 36/37] MIPS: genex: Don't reload address unnecessarily
Thread-Index: AQHVd+QCXFvgLjbm8k6qCb39EX8RsQ==
Date:   Mon, 30 Sep 2019 23:08:45 +0000
Message-ID: <20190930230806.2940505-37-paul.burton@mips.com>
References: <20190930230806.2940505-1-paul.burton@mips.com>
In-Reply-To: <20190930230806.2940505-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 236fdd30-a078-4d74-4edf-08d745fb250d
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022FCC985F4C31F5FBE3380C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(6666004)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JP5F9AGGQPgETj+tkZ/8pc0+HIgxa5Xd85Q/dikTPUh52ciWKq/5AB7XfbLWAoy7U3yROssFxK6dF+FiygVby94ZKhuXIDMyIU/gVq0Qr6zdTXHuzhZIQHQ14nhhL8U+5U3zwjQwgxoyu6huEL75ZvrxHU7IO3TVN+5Q1eXG1U8iI7YN9TClc+dJ3wEbWfKYtuGAJL9DDar+W1HHd9bdPhyyjtyAA4NBYRsh/0EjCijA2ebvxTAlmuxolNPkwhLXFlg/RAnhks+vajrDt2iwmHxbvxa17Tctkay9dLPFHy8bF8/r7cKmKqrDoYG9K398QGTNU8w3VLwDG2LGYkvySWBdNJmuawNMg9h3Kb16FMzz537kgwl0ojfO9iQGvf9Qa1zqXkulH+t9qu+8EgyBy0sVojft+DJcVcKJMH8uBwk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236fdd30-a078-4d74-4edf-08d745fb250d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:45.8750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3FAPa50iTdra2hqbteKbbnyQEcnn4WgA0bLtxnvr4138TKVo9pIErwIlIpE9KWKCwV0Y/QsS20V4QqqZUPD8ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In ejtag_debug_handler() we must reload the address of
ejtag_debug_buffer_spinlock if an sc fails, since the address in k0 will
have been clobbered by the result of the sc instruction. In the case
where we simply load a non-zero value (ie. there's contention for the
lock) the address will not be clobbered & we can simply branch back to
repeat the load from memory without reloading the address into k0.

The primary motivation for this change is that it moves the target of
the bnez instruction to an instruction within the LL/SC loop (the LL
itself), which we know contains no other memory accesses & therefore
isn't affected by Loongson3 LL/SC errata.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/kernel/genex.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index ac4f2b835165..60ede6b75a3b 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -355,8 +355,8 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
 #ifdef CONFIG_SMP
 1:	PTR_LA	k0, ejtag_debug_buffer_spinlock
 	__SYNC(full, loongson3_war)
-	ll	k0, 0(k0)
-	bnez	k0, 1b
+2:	ll	k0, 0(k0)
+	bnez	k0, 2b
 	PTR_LA	k0, ejtag_debug_buffer_spinlock
 	sc	k0, 0(k0)
 	beqz	k0, 1b
--=20
2.23.0


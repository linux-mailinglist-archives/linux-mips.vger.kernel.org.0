Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 480E77AE46
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 18:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729166AbfG3Qop (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jul 2019 12:44:45 -0400
Received: from mail-eopbgr720097.outbound.protection.outlook.com ([40.107.72.97]:51331
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728919AbfG3Qoo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Jul 2019 12:44:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JImMem1WssvLj0Zaiw/RAfGlgIkhbCsi+tybXUFvLSy2ccmcbzVOO25mCjZYwY8Aha1K2yOZB1muOKq4wV0pVo/qbEJPqIAjk8DuJ9Yqz78w+mg+uXSow6/+kR8075Eh+NFAIDBOqlV1EzImOhOfMmDsdf7HWbUcEkN4ZQMmmdfOXHSkTJ1xIUN4NE4uWdyujXQj453FYNnp2nxSmvjsMrAui7jvFtl5aStygxOithFn086VKVbHSp0X0YXZO4YoyG94a3cO5Rr/BjbxVrmYvk1jIMa6HxurcGicL1FLqnK262M3NtHFWIeN8P3NA4DICqB6isopKR8IFZ6PFLIBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZU0vjqH3sJYy+yRWhka7kLZSpMwQ+/M34P6kfZaagY=;
 b=FzOH6dkcmKMRfVMR9rOeCHFhV3MPbL9wYZq7EOA2lF4k44JFkNAGC6vd0+XtTvxa80gJ5y3oR5UrbBOg1rNaZ+DdXpg2sti9jphNF0wa4x2IzhQnjY2HZFi5h0IKI4aV/tYR3YrsTZt5t+EB9A7moLX4hXoAOinGW6y3gsCfVCVjL6WS2eVI6C3MfCdTyEayDtwFS6QLAYeic3Be8JR7v8ClPjX508hFcUigEQ7vovg/IBlmT1xHRQhgut3ugrZyV+3myMbWqsg6xS6z5+Lys1Nh16a9V5DiKRYS4h9w0HafiLxxsnEupOSn+hNHPt7LCsywatGs+EUVCXW+TIG+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZU0vjqH3sJYy+yRWhka7kLZSpMwQ+/M34P6kfZaagY=;
 b=meEIKVTuVo1hMvwTOvitxlnZ42X77mKg/nNGJ771yxvJROTQZGJexGuei13B2hrzDlsOawCMScBJvkIhFFONVD49tWj1vI3fzoyGeUCY4qin3jLMp0H0WAI88RVcVxIPFncnqiY4FF4PZ9ysyVg/xATlMXa4a3yBFqbBeEbxSR8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1104.namprd22.prod.outlook.com (10.174.169.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 16:44:42 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 16:44:41 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Fabian Mewes <architekt@coding4coffee.org>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Fabian Mewes <architekt@coding4coffee.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: Kconfig: remove HAVE_LATENCYTOP_SUPPORT
Thread-Topic: [PATCH v2] MIPS: Kconfig: remove HAVE_LATENCYTOP_SUPPORT
Thread-Index: AQHVRvYUMDlAtIaSWE6Vt2SZ2KJXmw==
Date:   Tue, 30 Jul 2019 16:44:41 +0000
Message-ID: <MWHPR2201MB127789D75581996A2075A12CC1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190729050834.22827-1-architekt@coding4coffee.org>
In-Reply-To: <20190729050834.22827-1-architekt@coding4coffee.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b1de7e6-d3e3-49d2-7b04-08d7150d3707
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1104;
x-ms-traffictypediagnostic: MWHPR2201MB1104:
x-microsoft-antispam-prvs: <MWHPR2201MB110466D72C0C0D30F2C4B1D5C1DC0@MWHPR2201MB1104.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(39850400004)(396003)(366004)(376002)(199004)(189003)(316002)(64756008)(66446008)(44832011)(66556008)(66476007)(66946007)(52536014)(54906003)(71190400001)(71200400001)(66066001)(8936002)(7736002)(478600001)(6246003)(476003)(4326008)(3846002)(486006)(42882007)(14454004)(6116002)(6916009)(186003)(8676002)(6436002)(53936002)(9686003)(55016002)(52116002)(74316002)(7696005)(68736007)(2906002)(102836004)(4744005)(446003)(386003)(99286004)(229853002)(25786009)(5660300002)(11346002)(33656002)(305945005)(6506007)(76176011)(256004)(81166006)(81156014)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1104;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CMAN2pag750KVx0vj39YHRNUsFgOSvufD/ez8vSt2aiamc4VRLgy6IqbE0jgqK+KSVg787Ng1qkeRq6gMrwhMoumSIG7UVtx0RcRJ9L3sAgCVy/aqsnIK7aGNxdiI4E7hz6M/B5PGcIaEhnZ62l9wdrTQ1iuH5SOLqnfJMm5SO32AHTXmQEBQi1HWAr1auhgLa06vQXL4CWmkppWAy16Tf4eu6PPjGOAAyJBxgDFm1Ezhi7bo+eJXFrkDZiP5cJqdTNGdQB7B0dys4bbZRyU626H3G6poBj+gqFljB2DRvOxiG1CCHg7qpmkcMCLshiMqeZrIvejKXrBlRPCpnsFJnW5+U96mPgdwf1PljxP9hgkzePvXlCzNwdJzJWyFUvoJgDyfnxrt4prU32jcwTvoRYWlRN3OHlaP4xsz2+0ppQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1de7e6-d3e3-49d2-7b04-08d7150d3707
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 16:44:41.4723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1104
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Fabian Mewes wrote:
> HAVE_LATENCYTOP_SUPPORT was removed all together in da48d094ce5d7
> ("Kconfig: remove HAVE_LATENCYTOP_SUPPORT"). This commit removes
> a leftover in the MIPS Kconfig.
>=20
> Signed-off-by: Fabian Mewes <architekt@coding4coffee.org>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

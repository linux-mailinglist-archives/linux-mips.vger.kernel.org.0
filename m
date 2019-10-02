Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEC4C947F
	for <lists+linux-mips@lfdr.de>; Thu,  3 Oct 2019 00:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbfJBWyM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 18:54:12 -0400
Received: from mail-eopbgr770123.outbound.protection.outlook.com ([40.107.77.123]:24449
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727103AbfJBWyM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 18:54:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=La8ohh3aiuUsGkwSOsRslvxQSus8+ZQKm4ErMbzXBu9aDCyvmpai6dK5lIXbcusIvmta2F4X3PSD0LzFnnH+PpHU1p2Qcb3o88Fr/r2RJSWrnM/XeJkobQ5MKAIxP+Qzt7062iaEuG5eIz9gQ0OQUnWBKhAL3ggcjJdo28jlWlsDItrBDHc41u46xB83jWgBvptzXTpsFcqWkkWwV/hDxHQhVcSbywmx2T7Z9kzXLNfSJXX+jirWXmnmvrqsgbAJaXLSgriS9td7qbP5zU7ans+EP15XocANBg76amcvg4RrFx4eX/4aTOCX1tqx8cjfbdnD/pgJrB8aLC0Vlhx8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6V2N83kZKCIZC2CN25Jx+KR2Jf+p6eNWOJ8Y3yeXYRY=;
 b=MnBCagLm2NRGwxdPHRHUKGA06m0gXYg2JRqhUDivm0rSvyH2str9xLqmY3YMFL05cuiwoIA4g39xcn/2R4sx8TmcNCeYsnvOW50GRdxJDpPjwB6EQyvY+x8Fy2KvpOnoy51IZtdGxeyFUkRdskiXZTII9nJrCVm0yuqIVhB+ysNjSpZBfAlELhZyrZd+Aq/kwCiS32iBtJ5Or8ml3xbCY6C0qOzkX+TS9RBvVkjGSZcz7xqoV5xFPG+lyGglBDatRuf8/lLtuUogAF4xVQwDp0LtqoEC/pNtaU/BOscny42jgIHe0aaP8Mr9oGJO+he+HgwX61PIRGhx8Bk1jBYZ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6V2N83kZKCIZC2CN25Jx+KR2Jf+p6eNWOJ8Y3yeXYRY=;
 b=gx9OfJIi+ncIDWitVkmWUQ9st+N/U9a+ZR3Ys4ZbVo2MWlw+CoXK0kzXu9FaEYXXGbNR2bb8dn/90/FFie989Cn7L0CrKMivyF/7spjFgn9F4vZyR3Jp3lapsLXyQPdtUexkCp+2ZlJZUm069bxJ/u3crignpOoNszqeRklVfpw=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1406.namprd22.prod.outlook.com (10.172.62.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 22:54:09 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 22:54:09 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC:     "chenhc@lemote.com" <chenhc@lemote.com>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] mips: Loongson: Fix the link time qualifier of
  'serial_exit()'
Thread-Topic: [PATCH] mips: Loongson: Fix the link time qualifier of
  'serial_exit()'
Thread-Index: AQHVeXRMpnqlZcTRMkWlftBxb59DFA==
Date:   Wed, 2 Oct 2019 22:54:08 +0000
Message-ID: <MWHPR2201MB12775BCFABEBAC5426879C41C19C0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190910035907.6430-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190910035907.6430-1-christophe.jaillet@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0036.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::49) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf0b02c2-cea0-4707-7c0e-08d7478b6f0e
x-ms-traffictypediagnostic: MWHPR2201MB1406:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1406856DDB38FE128234E3A0C19C0@MWHPR2201MB1406.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(39840400004)(376002)(366004)(136003)(189003)(199004)(14454004)(5660300002)(305945005)(74316002)(229853002)(4744005)(476003)(66446008)(64756008)(66556008)(66066001)(33656002)(6246003)(44832011)(76176011)(7696005)(52116002)(478600001)(25786009)(2906002)(6116002)(3846002)(966005)(4326008)(42882007)(52536014)(486006)(55016002)(6306002)(6916009)(446003)(6436002)(9686003)(11346002)(71200400001)(186003)(8936002)(7736002)(316002)(8676002)(71190400001)(81166006)(256004)(81156014)(54906003)(386003)(6506007)(66946007)(66476007)(102836004)(99286004)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1406;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: np42fj1kMcv9To8cJuw7/sm6JyDtCCUK7uE4as4OidGR0IxbfWXy8L1ppL4Fdp2hss81aKSnMO6Px4QBybe/BShqAHHJa/EE4RV+gTFZX2Xyiv6N3vdg6GOZer+4OYGZlRE1jEBH7QUafTxqer8TRCO7RTQXrk5gRfL0ofCQ1PWgrJ12kCs0T0Cu4IOcspGLv+jgo7n7RiaFIjWjlTpb6zX4R5i3lL/LfM3MMU8PybS6O2t0Pulw8qbZUHh9pzGduiMRwf1E1CQjzujELum4c6LlDmKtx8qH0RWKZSSK8llcuGknMAWjPE/rdG58E8Ib4bafJGyANhBKlmReN/qgtnYQHlAGn7aa27/sCg6hed4aVZe/3zz0bJIKcN+uPYYbgdmXBcJ2k4nZgwxWrltDBH9vzPSNlxUqdAyJTH+fBSebaToOd/aznuX2Yu5GEQ07+6CXo8Ey2JGSvKx5dkNUiA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0b02c2-cea0-4707-7c0e-08d7478b6f0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 22:54:09.3187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UnRUpI93BQTUP10p4apBKivHi6QmwS40Sf7IXDeV8AGjGxxFK5D1Xp9WkkPx7mY1GfrtOe6+uVGJ8hm6rkdaBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1406
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Christophe JAILLET wrote:
> 'exit' functions should be marked as __exit, not __init.

Applied to mips-fixes.

> commit 25b69a889b63
> https://git.kernel.org/mips/c/25b69a889b63
>=20
> Fixes: 85cc028817ef ("mips: make loongsoon serial driver explicitly modul=
ar")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

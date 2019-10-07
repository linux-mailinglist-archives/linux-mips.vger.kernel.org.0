Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F64CEAF6
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbfJGRuU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:50:20 -0400
Received: from mail-eopbgr810117.outbound.protection.outlook.com ([40.107.81.117]:55471
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728031AbfJGRuU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:50:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCdFT4u8DSuoXUxE08PxgIxXWrUpa6ecXnNXQCnJbFvIwdMwsTjZ5Hun+x/FC8Fr6UW5QJvxUiFjJiN98ccYre1pwId3+Jwld9AwjOb7RIp2+sB2NktSdSfq6SNsUfLfW/NYYq23oT7pxmLtxO4TXy/QD7BVsJ8c5C7bWawO68Qost5i8+epddfH7X8uzA1DnzQmKGWlufM7oKLlH7ihstDvX7Rj+2bQNfJl6fHudfk+lIvXCvl3Pq/CHMEOWmuvU/iisFAda7MO8WODM1slkY14o5nlMTjPCAXKSr35TcuOHH8Ge81R8fS9DZewGWAMJ/XDiVZPWDbbbRDm/utJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdUS2uy8hqham/FBwiqY9YbkBcPTFozDaoHZAeFrgWk=;
 b=dWmj/I/TsPX63AWD1ihuEnaVBYYzHF4dTqLB8+JaAs4DIBj2PClsHG/e+0Jushl66HGnw3CaZxsSQnViaH2h50LP+mLjaE89YqIgkTuBLxGe2r/Q0jlV7W0LArFyAc2aRPWus63UYwQGqg4NaeyfLMtL6F/u4wCGd/VfJ64rBIZxKCAAmAzdWQU4FOlomKuBK14j9AFV8uKb2r+Df6YRqA0qw3OLSJHBzVgg6LsY697Vid4iaCJMidQJj/RiwWz1JqXBn7AUCT3oDx1UpQ2yLTIAF4ZhFJlrfu+sW+xdGQvFjcafj7fY6+Grt9tzPHNDrZqmcoNkt1i4i1az54BKlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdUS2uy8hqham/FBwiqY9YbkBcPTFozDaoHZAeFrgWk=;
 b=Q3UoDVHW5lbFAhjC4tJKoezfHGWHKg50XWUHsahDePjEkdvFkecIguHcxkKb+7wzPR5n29/qp0q5ZRyIXtQN7k72BpQ5CaQTYcgksBJt+tA+zwckDrHZW0aGeuyB5r0+ZWO7hzLV1FuXDxKAlv1rAGwsFHmPv/n/BxwSBI33LVo=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1232.namprd22.prod.outlook.com (10.174.160.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 17:50:18 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:50:18 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: include: Mark __cmpxchd as __always_inline
Thread-Topic: [PATCH] MIPS: include: Mark __cmpxchd as __always_inline
Thread-Index: AQHVfTeuJXsc/v2mykuJXQsGQB/faQ==
Date:   Mon, 7 Oct 2019 17:50:17 +0000
Message-ID: <MWHPR2201MB12771C8079057E34A26D334BC19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191006131232.12700-1-tbogendoerfer@suse.de>
In-Reply-To: <20191006131232.12700-1-tbogendoerfer@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0021.namprd21.prod.outlook.com
 (2603:10b6:a03:114::31) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73a728ba-d84e-47c4-d316-08d74b4ed0a3
x-ms-traffictypediagnostic: MWHPR2201MB1232:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1232E9DE3EF3EA729AED141FC19B0@MWHPR2201MB1232.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(366004)(396003)(376002)(136003)(346002)(189003)(199004)(74316002)(386003)(966005)(71190400001)(44832011)(4326008)(4744005)(33656002)(102836004)(71200400001)(6506007)(5660300002)(256004)(6916009)(14454004)(6246003)(8936002)(55016002)(54906003)(305945005)(6116002)(11346002)(2906002)(446003)(186003)(26005)(3846002)(6306002)(486006)(66066001)(9686003)(476003)(6436002)(66946007)(316002)(229853002)(81166006)(42882007)(478600001)(7696005)(52536014)(25786009)(52116002)(99286004)(8676002)(66556008)(66476007)(64756008)(7736002)(66446008)(81156014)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1232;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lb9KhiXfGpobc4+YV7kEG8gwfhD5Mi3qZaR/O+IHyr4i2gSGewYjFgRB5zMnSsSioZ43JQrrFZ0vi7O/YImg2AytLcRKK3ZwCsRTAlYMk4ANFVNmVDc1NkeKruyZuwO29M91Iyuv3unmnX5UVcGqStG9xbA1vn4STZzS/iYalEBuKrmtAcRn4RfBAzQCQGjNmrj790bqyqFxAH1HpNofdkv5Muqwhum+0bhoEBmQyxStf8IiGWVdQKhIqItC52Rf1AS+rpoAoJ8dEOoSFGjE+ujkVG+yV2uGn+AGxRV9a4gtK/1A+2UKI73kgm/LoC2RmC9KxjSWNb3+ZFZdD2fte0gBiE9llXQb0tC0tnYCC4x3Ey1zPEzyjwXmRj5IHxY/nDjZZ9eT+EKfNxl/LPX7CTUWdFzpQg0kSbcF2rfEKN5j/f58o5NhdQXPkvim/f/eN0PGD4lEKyr0LS2Hmn0lzg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a728ba-d84e-47c4-d316-08d74b4ed0a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:50:18.0332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tKlj8UexRSt4Wjk0Xp9fdEOf5CzJRa99HmzXLYG30FQ6QalzfWXVE3/pnFSjFNeZnWiLnt0LblXxu9c878TUeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1232
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> Commit ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING
> forcibly") allows compiler to uninline functions marked as 'inline'.
> In cace of cmpxchg this would cause to reference function
> __cmpxchg_called_with_bad_pointer, which is a error case
> for catching bugs and will not happen for correct code, if
> __cmpxchg is inlined.

Applied to mips-fixes.

> commit 88356d09904b
> https://git.kernel.org/mips/c/88356d09904b
>=20
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> [paul.burton@mips.com: s/__cmpxchd/__cmpxchg in subject]
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

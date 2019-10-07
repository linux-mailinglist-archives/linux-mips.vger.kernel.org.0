Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E69B1CEB05
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfJGRx2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:53:28 -0400
Received: from mail-eopbgr820122.outbound.protection.outlook.com ([40.107.82.122]:43480
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728187AbfJGRx2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:53:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhlMHP5ApQJsK7Tf6Ol3WoXqRGrUXwBKgDHPBSETEUoIsL9lhMIL/G/jvuSBnLTWlDG45OKKx1ufU44EZRfV8wqxGL3Qf+Vj37XsRZ2vi8VG/w2GXU3Pk2n2K4kYvEj0kCZlVw3oFyvg5aYhEXUa67sQCy6NhrvbIcRBGm0F4lN6SnNN5K/u3JnBaly35ooIQsQZy4x0fyCNBTZys35l/5uW4CnYOa7NtUSflESFRqEbdtImt4RLn1yuZ82MnvTekNNm1zDGJX+1Rq3QbiHs3NHG7VUFa83RJYNYKhn+2LlBATK52CqvCji41HWGDrtCKsmvtbbBHrWOWfB057s72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poZicvolYB/udh9bJoFu2UEzjp1OOLiE5Z+HJfXsQ+U=;
 b=fwXVhLmb1NLv6NL85AhJsCAvrN468JYErCY3RG4IRbjjZCNrKy+Oe3AKCVhe2H4xCjvw/zvzjyXxyc63vHnM59egQgdmP2uC0J+WqiQeD107fPA7FVdrSDth/0vvuTJEpwglk63CDTO+VKBMzVFmwH1GraZ4eE15PwsPnz0wq3YqN5Xl4FhIUCCJ9ni7jyW62I8BM5EJHRH/WYyxnkuyxsSqN6scde296Oo3rgfoNOV5TGLa23aOGSbyzXehvkLv34Oa/lmiwWZ2brFld+5eaZTrMjTCE5HYVqSGxYk0mr2cQpReOj6ltH7SaBS1FazO0FU/+khtnvBci2tsulHOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poZicvolYB/udh9bJoFu2UEzjp1OOLiE5Z+HJfXsQ+U=;
 b=cS8cPUGyCzEXXb5bUNBFu4p/oaTCV+upf+T1iH2sP7dZXpL55TZEHW95dCkyl0dR1K6VsOD/PWkd1BYlEbl9qaJh19XeJgOlo1VPHr4/rjJOQN5SPtf9VzV/xgmKBV8GezI3euVrgU1mgjx/DqtNWMHLja2NXRBKqU/7pQbcVSE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1549.namprd22.prod.outlook.com (10.174.170.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 17:53:26 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:53:26 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/2] MIPS: SGI-IP27: remove not used stuff inherited from
 IRIX
Thread-Topic: [PATCH 1/2] MIPS: SGI-IP27: remove not used stuff inherited from
 IRIX
Thread-Index: AQHVfTgedzoPioJz1kurNljxXgYj/Q==
Date:   Mon, 7 Oct 2019 17:53:26 +0000
Message-ID: <MWHPR2201MB1277A22F3B8345715C97881FC19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191003122724.12239-1-tbogendoerfer@suse.de>
In-Reply-To: <20191003122724.12239-1-tbogendoerfer@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0060.namprd08.prod.outlook.com
 (2603:10b6:a03:117::37) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f97ef590-37de-4f49-8cdf-08d74b4f4131
x-ms-traffictypediagnostic: MWHPR2201MB1549:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1549A889F68B2BE8F2CDA733C19B0@MWHPR2201MB1549.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(346002)(396003)(366004)(39840400004)(189003)(199004)(52116002)(99286004)(476003)(7736002)(305945005)(54906003)(76176011)(25786009)(486006)(33656002)(42882007)(478600001)(2906002)(11346002)(446003)(52536014)(5660300002)(6246003)(7696005)(4744005)(71200400001)(71190400001)(66066001)(316002)(14454004)(229853002)(102836004)(9686003)(81156014)(6436002)(81166006)(6116002)(55016002)(74316002)(3846002)(44832011)(4326008)(8676002)(186003)(6916009)(26005)(966005)(386003)(8936002)(6506007)(6306002)(66946007)(66556008)(64756008)(66446008)(66476007)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1549;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eVzz3x8SqvGroNfKjGVIa2sSycrr/PWei8av4L/fL+87NpndE5gmL4Q3Gwpi23Nfw3uWjUckVxNHxyMfxV0tqugSo3521o2hVz2UbBsqtE/48B+cL/33grgi8W5Yilit3ewidkFbhAQpXXLg9wUjTCK0jk6C1+NEocZxFun/zMd7CHfqFxPxroIwh1+rNIAfPRNR3VIjY0O25byr8WF+dSh9iv752VJQVTPM/AGpTC8haPOMueKyoeWzHEVbIdOqKSiUUQ4BaQB0/c/904iVOJZXf+AeAndyyXisGLqC6i7Bq7KAL1iP74erVibE5zMF4AtdF9a1Rbetshqkk4JiBTw4KTdOa1P6u4wxSen808tnKsKXpq9hNN6/UGuwHK6aAsUx5XS4vlGAvyQrl/ZclhESazI3INXDJ5cbnsSstOF1TEwCW5hr7RO40Zbe8apK554GUDf+V0Hc+6gJ2VmKQQ==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97ef590-37de-4f49-8cdf-08d74b4f4131
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:53:26.6719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b7onFrrJVNQcqb7L5NYHWmbR/d8+IGjUe9iUIUG5BPWj/bucb1J5LkR1XmrstHNWEgW4dqx1YgVyOxkHZo0+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1549
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> Most of the SN/SN0 header files are inherited from IRIX header files,
> but not all of that stuff is useful for Linux. Remove not used parts.

Series applied to mips-next.

> MIPS: SGI-IP27: remove not used stuff inherited from IRIX
>   commit 46a73e9e6ccc
>   https://git.kernel.org/mips/c/46a73e9e6ccc
>  =20
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: SGI-IP27: get rid of compact node ids
>   commit 4bf841ebf17a
>   https://git.kernel.org/mips/c/4bf841ebf17a
>  =20
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

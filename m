Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43CF8C947A
	for <lists+linux-mips@lfdr.de>; Thu,  3 Oct 2019 00:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfJBWx5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 18:53:57 -0400
Received: from mail-eopbgr820104.outbound.protection.outlook.com ([40.107.82.104]:64782
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727103AbfJBWx4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 18:53:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtotLo3Nnq/njrHH3Z4JqP85btPZTTqVZoDgdymV2CwzQsSchOPMSORwQAwlJaFO8FitxwvES7rkYBBE/yBUIz1T6kTw1r4Y3DlqnSVo3npprqE6bwtOCxg6XOrnM/rq0uXCvYfTXELaOXGyZCmoSdeLWJBVZh7SkJEXRZlNrRQ7u8I/Ee2v1ic7Da2SdmyzIHmIxZtYhFxm4KL6M+n/CE4WPIH189S7KqFqx4vVkM8AcZAiHjmtQbh1us+icNPkom+RuwSmtjNzQVawXL7I3zP7MEy09ew9yF/6bp2wN/imejBNe4wxtEInPXYLzRVmBLZlsOStcqCg5K9CQ7Iezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TCcg7FcP6uzJuPUzPeb2WYEMlkwN6n3kYPnHOu6WYs=;
 b=g4f/YXU1RppoVyBt2CBrJyXnf0dov3iv5AmJpyoc1dCvdhBE1faoGxoiv2yQpAMcaqN5dL5e06Bdzbi4i2SgHBYbZmTYdc3H9VMvL+D6WMdV1cQKd21QzJtDZhwjsrEBpdxtrwHD0MP3xQCdr1h6QLIJzy1qL7VVOIGrBeQd5CQcIvZQQdevI7K08OUfUSTgdpFvaa+Fazmz3ruDQlgKCY33RaPJuaxnZjMd32CMhff4ne5j5cJrndcFM+Pm5pCyqe1o725mNr/W2AF14CaTkPBi/TAnL9JFYRYoXKGO+IKK7mtbYp1lxAEuxG56OhSIDon8fSIv/di03jQnNun3bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TCcg7FcP6uzJuPUzPeb2WYEMlkwN6n3kYPnHOu6WYs=;
 b=s3jO//zOWwPSnDzxO2VRCmkRU6afWkTHsdCxlBZ/UD6/jnT06C5xtJwi3jmaqZrg/A0Kh4RfZJWr9n3NEazWJ+9Q96r0WXju5vvp+UDiIwt+ug1oQKXuXD2iK+7BZ/uMiThEQgbYyEzXLl0SlJn28DyEdX7bPglxXa5eRPJK85E=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1294.namprd22.prod.outlook.com (10.172.60.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 22:53:54 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 22:53:54 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Christian Brauner <christian@brauner.io>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Wire up clone3 syscall
Thread-Topic: [PATCH] MIPS: Wire up clone3 syscall
Thread-Index: AQHVeVOQR1sGlenHSE+Gka15+Z4wnqdH9d+A
Date:   Wed, 2 Oct 2019 22:53:54 +0000
Message-ID: <MWHPR2201MB1277222BE67B75673F1A4A0BC19C0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191002185942.295960-1-paul.burton@mips.com>
In-Reply-To: <20191002185942.295960-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0085.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::26) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc7dced0-b4cf-4249-b008-08d7478b66b0
x-ms-traffictypediagnostic: MWHPR2201MB1294:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB129497CDB8C268BA8DCB78EFC19C0@MWHPR2201MB1294.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(136003)(346002)(366004)(376002)(396003)(189003)(199004)(256004)(55016002)(478600001)(26005)(6436002)(186003)(316002)(74316002)(14454004)(4744005)(305945005)(54906003)(25786009)(7736002)(99286004)(4326008)(6306002)(52116002)(76176011)(6506007)(386003)(102836004)(486006)(476003)(42882007)(8936002)(446003)(966005)(33656002)(8676002)(11346002)(6862004)(81156014)(81166006)(66946007)(66476007)(66556008)(64756008)(66446008)(5660300002)(66066001)(2906002)(6246003)(6116002)(3846002)(44832011)(71200400001)(71190400001)(52536014)(229853002)(9686003)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1294;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EN9dddTtW0Xi/caKTcFegdkPga69NltsDeTbf+Sy4a84cNKj+A9M0PHJCkwKR47RV2kFzWSxyu1RL8HCXiyyRcRp7o0N8NjUNfOvkP36ppELIisAeH/NlgY8GqgarNUx9DVZdZFm0PH7ZKRY0mzXbAI3nO4KMY2FrUFg7XJuTSbBfIvOtOlby6+UzlBI5cQkCS9L6sOcknOfZroBQDUlyMFXr0k4GnplPnmWxrPIqq1QJGZB4ARr9hkCW5iPFeTyWd+eGsM/7Gd5Z/B9H8/hOp204GUBuA3l0OcxdTxEOt4SdttSKUnve4TjcqLRlxB64gfPFbWuUuZPOS57+rOkAN5PZoS4g5DncZKTT8uQW07v5aWOhuedVv+w93LIy5VWLPVn1SaCxJzBc3L4ltKVtditacOtAGofQzNqbGs9sNDWt+Z8aEmpmI6dT8jhpyGDHnMsZHFlFmJtJdVoxi+5tw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7dced0-b4cf-4249-b008-08d7478b66b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 22:53:54.7175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AF2GcURNEEmngEJIrGDY2xwMtq1s2n4miK5KZG+HULy6UwmDQegJrv5ES/wPK+gglDeM3ZXoVidH/OMfKnYrJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1294
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> Wire up the new clone3 syscall for MIPS, using save_static_function() to
> generate a wrapper that saves registers $s0-$s7 prior to invoking the
> generic sys_clone3 function just like we do for plain old clone.
>=20
> Tested atop 64r6el_defconfig using o32, n32 & n64 builds of the simple
> test program from:
>=20
>   https://lore.kernel.org/lkml/20190716130631.tohj4ub54md25dys@brauner.io=
/

Applied to mips-fixes.

> commit 0671c5b84e9e
> https://git.kernel.org/mips/c/0671c5b84e9e
>=20
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13981CEB52
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728212AbfJGR7U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:59:20 -0400
Received: from mail-eopbgr710135.outbound.protection.outlook.com ([40.107.71.135]:35603
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728079AbfJGR7U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:59:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9oUNSm8wAr8U4FKsnyjQQcpo9hf83F7ac+/bDqnC1SYDxDDH4+cW0exlLnF3GFR8V6VUV8C4EF8zu6CPpodV6OOn6oeBSrCvdfdLUDpPl0BR2K7erqlT5ICE4fag77G2NWAXdei/PkN+JaE45tz9SDjy2aqHFEnsk2tcVXuErHMx0IsWTmQyCSCNUxEvf9ilpXKl3KhNSzET+xgO3SaSJFLhXsahsYqI267ww4xebZw2gscgfXRem9uDu/MGePj48t9W3p/gJUsAY2GzZ8dwLpSz08i9vW6IcAtjzRLcGb31ROqcdT8XOGVKslMRnTQ9AKWgk3Izcws5uPiDsC56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpugprrxkpYyCFw31flchiDPUSvNqCsv1FxjbiTbckE=;
 b=ZXNm3aK67PYosKiNxq8eEX5jS5a018BQ7ZNADFo2oUWQtkcbMK49e552AAmdOu5go3KnOlsN9uZcMrDhpmxnL1lQF8ZyFF/Q4Hy0GArXxyG+hsRgDR/+Gx4be6rOL6NpAphSHm0z1n/AGxcVyZZopvWpb7BiHGwT1YqT98Tpr6nLalAQvp4wva/8BUKtVhht8EgIFhS9VUpDri0nAyMZlOlm+F53kwRuNFeh2LMvfvVTRIRIqLaqEeXS6AkUbqK/yz3Xz1B+pOfFfk6fFLu7TLYEVWETgOmvbc4VJsgtyVMfgwYNVBwV8tFI4LOzMnWCQdZhP8dNBa+wk0/2VE69BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpugprrxkpYyCFw31flchiDPUSvNqCsv1FxjbiTbckE=;
 b=F2owVDi7Ep01desXvKu6V0T9Ii8Wy4dIZLgNPwk8GLzK3dZ9AhN1hx7K9RlIRS988lljt1WbaWPNgocLXh5QounfcWC3QDCxBq6SxwSMuwIU0SxZTkrBXgJ73yz8SVZj6zEjc50kFEsc5Fazs5AH6o04MMBOE7+N3Bx4w/dmNT8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1470.namprd22.prod.outlook.com (10.174.170.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 17:59:18 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:59:18 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Aurabindo Jayamohanan <mail@aurabindo.in>
CC:     "ralf@linux-mips.org" <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "alexios.zavras@intel.com" <alexios.zavras@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "armijn@tjaldur.nl" <armijn@tjaldur.nl>,
        "allison@lohutok.net" <allison@lohutok.net>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] mips: check for dsp presence only once before
 save/restore
Thread-Topic: [PATCH] mips: check for dsp presence only once before
 save/restore
Thread-Index: AQHVfTjwGrGVHbSFvECLy1pIiGJbFw==
Date:   Mon, 7 Oct 2019 17:59:18 +0000
Message-ID: <MWHPR2201MB1277E7B787B02B8ADB37E2D9C19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190913120206.9234-1-mail@aurabindo.in>
In-Reply-To: <20190913120206.9234-1-mail@aurabindo.in>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::29) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57346c07-708f-4d0c-3e87-08d74b5012a6
x-ms-traffictypediagnostic: MWHPR2201MB1470:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1470EC7A15495F3FC0802255C19B0@MWHPR2201MB1470.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39840400004)(396003)(376002)(366004)(136003)(199004)(189003)(52116002)(33656002)(7416002)(7696005)(76176011)(99286004)(6436002)(256004)(14444005)(476003)(74316002)(42882007)(11346002)(4326008)(446003)(229853002)(7736002)(305945005)(44832011)(486006)(102836004)(6116002)(3846002)(6246003)(71190400001)(71200400001)(6506007)(386003)(26005)(2906002)(186003)(1250700005)(52536014)(9686003)(4744005)(6916009)(54906003)(316002)(5660300002)(25786009)(66066001)(6306002)(14454004)(66446008)(55016002)(478600001)(8936002)(81156014)(66946007)(64756008)(66476007)(81166006)(966005)(8676002)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1470;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1alN3vTzsY3RTyU0nGRudf5JMTk8sZm1JsEorVs7MmuNFoTnSYF8Nd4H9NbvnYZiS7zX3t8OKZMu+3jKVTvvXUCxQqFitkhmZhkin8hP4uG34MK/Ks8t5Ib1xRPBuSF5VhOXq96qmnPvKIQet9wBgLcfvtxkHpwsLKirlWpzgnauPp5VkmCV9J5+/45Dl/Elx5kTqU1JWg5MT+RbkI5ykZrBy4Ukgz+Ef48fybuldVAyknlL6lOpWpFmW01VyNaSetrEuzB+Lqp7Ao2i+Wouoj5+DJdFZZyN9KQd66cOcdbAnj2uAkRONfHw++rJIWBYGBbWDdwK/AtdkxDP5Wj12Oh0LRcjRjdYe8OCXj4arxpTSgBfka3yPdJS4BVoH1RqPtnjVgFuYhmTyG/iXkSNYBQCy8AgN44Bsblpg9Cm3xB/0x/Zb2c7pAcSJE86LFfEakmsGHuzBvP92cLv/Y6QYg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57346c07-708f-4d0c-3e87-08d74b5012a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:59:18.0935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SzzS65YKhm6dYiHdazvzdXi9Ly8mJHJ5V8YXO0NITXGCY0MohgmEaV9wCj3Jp0znVfa9zp+AK3ICTTfy5rImfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1470
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Aurabindo Jayamohanan wrote:
> {save,restore}_dsp() internally checks if the cpu has dsp support.
> Therefore, explicit check is not required before calling them in
> {save,restore}_processor_state()

Applied to mips-next.

> commit 9662dd752c14
> https://git.kernel.org/mips/c/9662dd752c14
>=20
> Signed-off-by: Aurabindo Jayamohanan <mail@aurabindo.in>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

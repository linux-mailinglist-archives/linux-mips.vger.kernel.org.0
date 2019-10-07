Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5FD7CEB19
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbfJGRyA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:54:00 -0400
Received: from mail-eopbgr820092.outbound.protection.outlook.com ([40.107.82.92]:38992
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728031AbfJGRx7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:53:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d25tJDxTZNmg2N0/1jxj7vX/zmeH9Dr/Up6GF1uI4tiyams4dgd1RZOMPj38Ulw1BNDX36iFNlDo57nuUPrFWy9kq4X8lVIDFaZDIotpc34A+gSgDZ1lhHFZA7rEpFCKTlinzjwc6LbY9PV+jDD9N/iZy8EJZMCcZQ2ugVDfJTRxmbwVY8Evq+TcLmtoKw5MOLPNlEWIlbRS7ocNLP71WU+Nxv2ukP5qNRpsPjSMiGlaDExL5OhHzO28rfwHvePxx2fzhEBiO1jwSBda10rwf63cSAjzCTcsUDxvSB+j1i5ZgY53CldIsBCj+gWW6Exa42S1bJ6X2if2a0xjhqZnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XpvgLKNhpQokMnAT8SAtQ2ibZVNU2dDeXyKesDNAOw=;
 b=ZQlpEY7gl39yJGeMPMMO35uMGJYN1lo9Ox4vt8j6yiSSqPGlNDu1u5+ItCBX0q3sH8l+oFxdu7l46vJ6cPltVvrNdk1zL2mbb+bNmWxuVWMz7L4vPKxuWJ4yGbRE+RfxnHOGOSNVqd9cyzVH5VihLlghWgBIQWllpY7XiwWbLT2/lE8YldY9B9pr1BioZ2TE77AHnZ5sR1THChdrbb9zk17B7g4jSS+OXkiHbizUQbzG2OCFDUZQj6k1DYsSS12r5lEwmKKkFmP6U573hpQcmbGigpupY90K4bcX2TDTnX1Gk/nwWfMY/+7LVFrnvcNToEWSdKmTgoSKKNw1GjIf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XpvgLKNhpQokMnAT8SAtQ2ibZVNU2dDeXyKesDNAOw=;
 b=Y/kbmBeB0uc0tsxvr3djRGQa7cA3EhueaAxI9kzMsn4gxcfeSnE40JXyn4C8J0SowlA0Cp1dwhx3f4M3Hl8fM/cSby1vEO7W704SAhdoHqaHWnc8eCfsbe2kvTe23byF7VPjj89v5rZcwtnv094sCajQMVkRSUB/TknfN7qeSss=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1549.namprd22.prod.outlook.com (10.174.170.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 17:53:58 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:53:58 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Alexandre GRIVEAUX <agriveaux@deutnet.info>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "agriveaux@deutnet.info" <agriveaux@deutnet.info>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] MIPS: CI20: DTS: Add Leds
Thread-Topic: [PATCH v2 4/5] MIPS: CI20: DTS: Add Leds
Thread-Index: AQHVfTgx2izd6/5rC02LTfub6mRJAg==
Date:   Mon, 7 Oct 2019 17:53:57 +0000
Message-ID: <MWHPR2201MB12775CA989C9C00AD5E92D32C19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <fa61d681bad1d551876ce879643226dd59611316.1569955865.git.agriveaux@deutnet.info>
In-Reply-To: <fa61d681bad1d551876ce879643226dd59611316.1569955865.git.agriveaux@deutnet.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::15) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c8fc9d1-cfe9-4502-8351-08d74b4f53ac
x-ms-traffictypediagnostic: MWHPR2201MB1549:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1549028EE674B5664CE815B1C19B0@MWHPR2201MB1549.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(346002)(396003)(366004)(39840400004)(189003)(199004)(52116002)(99286004)(476003)(7736002)(305945005)(54906003)(76176011)(25786009)(486006)(33656002)(42882007)(478600001)(2906002)(11346002)(446003)(52536014)(5660300002)(6246003)(7696005)(4744005)(71200400001)(71190400001)(66066001)(316002)(14454004)(229853002)(102836004)(9686003)(81156014)(6436002)(81166006)(6116002)(55016002)(74316002)(3846002)(44832011)(4326008)(8676002)(186003)(6916009)(26005)(966005)(386003)(8936002)(6506007)(6306002)(66946007)(66556008)(64756008)(66446008)(66476007)(256004)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1549;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cMfkGTTD6BtKQYTgQUsSskk0VcjeWcWPKB+2/GDBzt0QnmPItl3myAD8J9Ljz3KDnC49OtXhkBfpNfxIFaoFJPrlNqAh9tdQ/5g9rwYPh5omlKxPGMR8Yiz8wQMH3R9hDDlKnzXSDXLG3l7r8MzThoTYn2Q1OrUm2naUc/hli0JVpkVJuxw7sMHJs6t6WewSfan4EQMZqjpTiFMOFD+gP+w2hZ//kr1+urpErt3qLWEso7WhU2U8Tv7OkKfru+yOyNBE27V2IO63XVdLqsbJTeu/PO3L2iCqE3/kkmlC3aGBEpBl20JDaWor+fabqFu9EGG81X6Zwvr+KFHFQv7iBEMBaViKe6ocwO2ihfNxTB1vpubrjyIpxMC4z5ZvWXUb2jJE0Y7iSCuh1maai+9xipMEj4mEtCgHmZdyioAJBIKuyY3fScrffuuXd1qOAjNTgeG9FtFwWf2R5DrYK+qDGA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8fc9d1-cfe9-4502-8351-08d74b4f53ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:53:57.9526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XAuPcg7L0k169I8Zn/9avuuN4qYyvY9UwpFkvdE/2dnJZfwDc9D1XMfwrXqWOP2WhNnTSarESDJFneGZ4lEoMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1549
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Alexandre GRIVEAUX wrote:
> Adding leds and related triggers.

Applied to mips-next.

> commit 24b0cb4f883a
> https://git.kernel.org/mips/c/24b0cb4f883a
>=20
> Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D80A89684
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 06:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbfHLE4W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 00:56:22 -0400
Received: from mail-eopbgr690110.outbound.protection.outlook.com ([40.107.69.110]:29920
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725808AbfHLE4W (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Aug 2019 00:56:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KD/oVdmJQTbgRCXNplfaPAQ9q5mMGKBEOOBxbWyjsCSJSH9Jc848hQhdNPtDWmkWGTctQKtwmTbWy1+F/IOcooc+Az0IPfF7FA3q6vC6jKuuRa7rosbJirx6PnxAzgatu1lBRZyFBxRtg+EqB0pkmUWM014/303JvXHByiuuyGMeLUjwYvkSyJ3GQWrWFDOoYBNNBeerBxTGIoAempLNmGC0gU+z4rBOP8a/4sEkcp8IVby4DLCv77MWIaRShLD+nOmKjpJrBwmuZ724cZweWRJVvgWQFNufLYXL3nkFyIQNvXCoCTundnJpJe3bR5Lse6K+HLCjuX53D6/omKnYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QF8UpJYGtwDPZ9yJBse6jIFJjf/39sLtWmKqw+Sr9Zg=;
 b=cOy7MeaxcjYF60YnpiBpGsrdnxsE3gbJ2PhgxSVwAKgzoGOjJiaPc9wdSavTsioEsX8NDWi4Rnb/xw2o2aEZ7ddaV3REdcnhdbZkp995jY3XrgpsQblovVVDxLACt5TGo2k84axOGJD5/NZbKb27EE5BsdVw0uy1SaHWFDrrA/HKQzKMOXhdeWFcJDPQKT4kERND5ngD9awYLGWeGdlKdWAeqlEqno/pV7uIXjBtUHPJATFphCZjI2hP7UrEVYyUU1Cj4+y2X1c06MqmAgEeEAO9/h6DT12K8t08+j3dTepscWXWjTVRGugx69vXarTcds40eF7GsbB9l+1v5h86eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QF8UpJYGtwDPZ9yJBse6jIFJjf/39sLtWmKqw+Sr9Zg=;
 b=tVZAV9pcXArCTSCCQxWQvGGk8JV5Hbczy/e/AE0THQbZPECkq6MYzSrY5BiIDNsfrv4S52vPUTZfJZBreczTn8IohV13I6V1BUCfVEzuG9gn3DofdEVreMEKQKj8+PFA1y8PD6ub9sL0dTKArMRlExXRAiFRmYEq7q6yY5a6910=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1581.namprd22.prod.outlook.com (10.174.167.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Mon, 12 Aug 2019 04:56:20 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 04:56:20 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "yasha.che3@gmail.com" <yasha.che3@gmail.com>,
        "aurelien@aurel32.net" <aurelien@aurel32.net>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "fancer.lancer@gmail.com" <fancer.lancer@gmail.com>,
        "matt.redfearn@mips.com" <matt.redfearn@mips.com>,
        "chenhc@lemote.com" <chenhc@lemote.com>
Subject: Re: [EXTERNAL]Drop boot_mem_map
Thread-Topic: [EXTERNAL]Drop boot_mem_map
Thread-Index: AQHVTb3/KP1SZlftUU2CZ8shWcxSeab2+REA
Date:   Mon, 12 Aug 2019 04:56:20 +0000
Message-ID: <20190812045618.ncqtfm6qmia6cxaz@pburton-laptop>
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0011.namprd21.prod.outlook.com
 (2603:10b6:a03:114::21) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76739b02-1d2d-454d-383b-08d71ee16a8e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1581;
x-ms-traffictypediagnostic: MWHPR2201MB1581:
x-microsoft-antispam-prvs: <MWHPR2201MB1581060A6935E6830D6FCE31C1D30@MWHPR2201MB1581.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(346002)(366004)(136003)(39830400003)(396003)(376002)(189003)(199004)(6512007)(9686003)(81166006)(8676002)(46003)(7736002)(42882007)(102836004)(305945005)(486006)(53936002)(52116002)(81156014)(6506007)(478600001)(386003)(76176011)(6916009)(25786009)(476003)(316002)(6246003)(66946007)(66476007)(66556008)(64756008)(66446008)(446003)(11346002)(4744005)(71200400001)(71190400001)(4326008)(256004)(54906003)(44832011)(2906002)(186003)(1076003)(5660300002)(229853002)(58126008)(8936002)(14454004)(33716001)(6116002)(6436002)(6486002)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1581;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L5IsMVBm3POcXkC+hwUCFMzOsjgzNq2O8AXZITg6SUx0mQV40XgeyuftPpueBt38r2bzQ5Pz6ydIahrfp4BDeR823Bt06iLDLALcHMcvhWA/DhnbLPpCMpihhVNgyn5Sr9PWAcaL9HEVXTN2NOi1/4Z9rXzqERr+MtHVfiFskQF+0Dp54LdRoe36pIfcz5HfW4rl2QlCSJ8f+1Z8zIBxT8jZa1jYgExc+1ZfxLpCN9qE5q7sCid7KULk2ScbPsqSdayUEHsiR7BqlDIc8+o8i4Sp0rMa9VhUpL5PCCxurl9lz9Nt2c+OYlI091aecuXDR85+q67jUop3S8qthe4wGTjugXKYp2likRhYzyIgtlkpD72CGoeDFcGCaTPFgCQEoTCGzsUv5ACxc6DabPYu0YGkarmoIfLZeK54x8SV12I=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4AE0C34623BBCA48A7B16F5F7423CFD8@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76739b02-1d2d-454d-383b-08d71ee16a8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 04:56:20.3123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IrylAUSrFzrrGilhNfjiRXqSHYcprPGgV4I9OBE+EIB6qk7XItb52j6MXR5qakUDs4lo9E4WtmuUvDuTI8TdKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1581
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

On Thu, Aug 08, 2019 at 03:50:06PM +0800, Jiaxun Yang wrote:
> Hi there:
> I was trying to make a generic NUMA implementation for ip27 and loongson-=
3,
> and the boot_mem_map without nid support become a barrier of merging memo=
ry
> init code.
>=20
> Rather than add nid support to boot_mem_map, this patchset drops the whol=
e
> boot_mem_map as it can be replaced by memblock functions.

Very nice - cleaning this up will be a neat improvement :)

Am I right to suspect though that patch 1 will break the build for all
platforms that make use of boot_mem_map? (ie. all the platforms touched
by later patches in this series)

Thanks,
    Paul

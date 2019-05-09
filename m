Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4B2195DA
	for <lists+linux-mips@lfdr.de>; Fri, 10 May 2019 01:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfEIXyu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 May 2019 19:54:50 -0400
Received: from mail-eopbgr810125.outbound.protection.outlook.com ([40.107.81.125]:6064
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726701AbfEIXyt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 May 2019 19:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6LpKe26DCexrrqFo0FVXVMPJNvpHbzyDK1HZIWiICg=;
 b=YJnaVUoZ6PByzQwTEdz18zlPV9dr0/+OP/YTNY+CFxIP/pWZrb9CZqLMNu09Wm+l6nIWP4QmMrO4pZ/qk1Xf82rNur5SU4wQy9kfFP5gah8wFw8iSRySSc1ztyOihsxRb2x9GcNEb0EWIfjkJYSuCAIaN1dZE28RoiNSl42XxZY=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1047.namprd22.prod.outlook.com (10.171.221.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Thu, 9 May 2019 23:54:46 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::954e:662f:d233:dc53]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::954e:662f:d233:dc53%4]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 23:54:46 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Christoph Hellwig <hch@infradead.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] MIPS: SGI-IP27: move IP27 specific code out of
 pci-ip27.c into new file
Thread-Topic: [PATCH v4 1/3] MIPS: SGI-IP27: move IP27 specific code out of
 pci-ip27.c into new file
Thread-Index: AQHVBRkpG9b84HQxUEuMbXrsdvRr/6ZgwXGAgAAaYICAAp8jAA==
Date:   Thu, 9 May 2019 23:54:46 +0000
Message-ID: <20190509235444.3bvfwkl7y3cjc2yv@pburton-laptop>
References: <20190507210917.4691-1-tbogendoerfer@suse.de>
 <20190507210917.4691-2-tbogendoerfer@suse.de>
 <20190508061815.GB19227@infradead.org>
 <20190508095239.d055251e838a9e4fd2eff522@suse.de>
In-Reply-To: <20190508095239.d055251e838a9e4fd2eff522@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:a03:40::47) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [73.93.154.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f23a97b3-e54c-4461-a8d8-08d6d4d9b6c1
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:CY4PR2201MB1047;
x-ms-traffictypediagnostic: CY4PR2201MB1047:
x-microsoft-antispam-prvs: <CY4PR2201MB1047E216A0271FB94852DB7CC1330@CY4PR2201MB1047.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(136003)(39850400004)(346002)(366004)(396003)(376002)(189003)(199004)(76176011)(99286004)(6916009)(6512007)(9686003)(102836004)(52116002)(2906002)(7736002)(229853002)(305945005)(6486002)(6436002)(6506007)(4326008)(386003)(6246003)(6116002)(3846002)(316002)(54906003)(26005)(53936002)(58126008)(478600001)(256004)(186003)(4744005)(1076003)(73956011)(64756008)(14454004)(66446008)(66556008)(66946007)(66476007)(33716001)(8676002)(486006)(8936002)(81166006)(81156014)(476003)(11346002)(446003)(44832011)(68736007)(5660300002)(42882007)(71200400001)(71190400001)(66066001)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1047;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xPHLggLPhxFE24Ny85cuUs1B7s35tIjcG1uA0Exu4xZMZzkCqCd1j66GqtFMZvZ29CbU24ma4gYL4E5n7eSxmKIxpN3NrZvZU0lY+2rDpO7JXldo7QdIgonp++xwPJRyQ5WPBDcmPH5ARkRdDfp8+dWBLfNcD77NeDjiK9bJW0D0qwkCADaeFgouD2VzAFWKGuzihNb6/lpoZ3+obKmm3hXwj/vFBhktUnx7+F8RrNrPTnFh9kasSzKpBdDb8Zkm8Pq+THChS8MJwvXyvSL5xtjCiVchwsAQ636R6rL4/ZVwvlMuNFgiHnE1ISDDq9LV6Exm22Hvgo3CFKT5fRTAUkyU0g48ijadW9XdTuYmZf+CFZPH+0mKkbq/+Leq188rpkiRlo5noxWhFIXgTF5s3mG3niqiYWn7fLQT0Fn7tco=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2D7D8AA3636B67449B080C63319D98A7@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23a97b3-e54c-4461-a8d8-08d6d4d9b6c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 23:54:46.2023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1047
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Wed, May 08, 2019 at 09:52:39AM +0200, Thomas Bogendoerfer wrote:
> On Tue, 7 May 2019 23:18:15 -0700
> Christoph Hellwig <hch@infradead.org> wrote:
>=20
> > On Tue, May 07, 2019 at 11:09:13PM +0200, Thomas Bogendoerfer wrote:
> > > Code in pci-ip27.c will be moved to drivers/pci/controller therefore
> > > platform specific needs to be extracted and put to the right place.
> >=20
> > I thogh the drivers/pci/controller was nixed by Lorenzo?
>=20
> yes, I missed this. Paul should I respin ?

No, I've basically dropped this patch whilst applying patches 2 & 3.
Could you check that mips-next looks good? I checked that ip27_defconfig
builds but don't have any way to run it.

Thanks,
    Paul

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D3E10BEE
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 19:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfEARTC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 May 2019 13:19:02 -0400
Received: from mail-eopbgr700128.outbound.protection.outlook.com ([40.107.70.128]:15114
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726067AbfEARTB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 May 2019 13:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KS6/d+4+IXnKcBtYuGKMIYeMAKopB22B+uUclECs8fI=;
 b=jCPOVE/ZeOC61qH4NX0GpnHgszZLyMY4sX4JSmpn3ZuWtFCqOlSX2w+m5hiP7cQTu7u6mfCc5xwqg1VE5MxM8ab7cD/yiZ9FI6E+lXJtx/trtOnZ3LEHGWPHg68ju8TTN5Js6O7USPQ/tYcIH0S7GtVyxK7WXbzKo4/4VWJ3Fnc=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1021.namprd22.prod.outlook.com (10.174.167.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 1 May 2019 17:18:59 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Wed, 1 May 2019
 17:18:59 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH 4/7] dma-direct: provide generic support for uncached
 kernel segments
Thread-Topic: [PATCH 4/7] dma-direct: provide generic support for uncached
 kernel segments
Thread-Index: AQHU/0QKKKiJlPSrw0CLkNp0FmAaxqZWhWOA
Date:   Wed, 1 May 2019 17:18:59 +0000
Message-ID: <20190501171857.chfxqntvm6r4xrr4@pburton-laptop>
References: <20190430110032.25301-1-hch@lst.de>
 <20190430110032.25301-5-hch@lst.de>
In-Reply-To: <20190430110032.25301-5-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0064.namprd02.prod.outlook.com
 (2603:10b6:a03:54::41) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c8e4522-e224-4b80-ccd8-08d6ce59191e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1021;
x-ms-traffictypediagnostic: MWHPR2201MB1021:
x-microsoft-antispam-prvs: <MWHPR2201MB102130E0DCDA14F861D1BE55C13B0@MWHPR2201MB1021.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(346002)(396003)(39840400004)(376002)(136003)(366004)(189003)(199004)(6486002)(486006)(476003)(54906003)(68736007)(229853002)(8936002)(53936002)(1076003)(316002)(42882007)(6506007)(66946007)(11346002)(76176011)(4326008)(44832011)(71200400001)(8676002)(6436002)(66476007)(102836004)(66556008)(33716001)(66446008)(6916009)(73956011)(71190400001)(81166006)(14444005)(81156014)(446003)(386003)(256004)(52116002)(5660300002)(26005)(6116002)(25786009)(64756008)(14454004)(99286004)(3846002)(478600001)(66066001)(186003)(7416002)(58126008)(305945005)(7736002)(2906002)(6246003)(6512007)(9686003)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1021;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ntzWWyOYuaRBf5WE4m6wkrUq087GSxTKBz0aQPbdDkCgoUPDuuHVlhs9NYhW19DgGvrmgMtGgfeOoWfqhyl7kR+cmE/2GrKR9u6r3sDTDbPUuq9qGtQ8OBkYrwQgIsYJmpp3eNFzmD7k/a6lJ+CbTVeX8SZHfRI8JPlKSt3JI78gtG79wpYhn44v/zkT+5ndWJ2B3DquAYGMd7rTvr/7Swu3OQc1kwi/9IVnCYyCjnMHBlxrqASJ0SmLuaQs/CIYjMOcy6nP0WulKc47Q8L3Tj5TttJZtLOSTRBkrMY/GRjm9FVuzYOjl6JbuDBxwxUlq4uOC4OZ2z68ZQtDi18cw9OOIxy+MZl4hLlM5A0gSlw4eMdBiTy3er4qhrVgUmqQ9tBDcsjiZ63Hye6IH19MGRwXRC8TlfnplH8URb2mURA=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D027B3DE25938644AE5DFE1EA5806D28@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8e4522-e224-4b80-ccd8-08d6ce59191e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 17:18:59.1556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1021
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Christoph,

On Tue, Apr 30, 2019 at 07:00:29AM -0400, Christoph Hellwig wrote:
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 2c2772e9702a..d15a535c3e67 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -164,6 +164,13 @@ void *dma_direct_alloc_pages(struct device *dev, siz=
e_t size,
>  	}
> =20
>  	ret =3D page_address(page);
> +
> +	if (IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
> +	    !dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_NON_CONSISTENT)) {
> +		arch_dma_prep_coherent(page, size);
> +		ret =3D uncached_kernel_address(ret);
> +	}
> +
>  	if (force_dma_unencrypted()) {
>  		set_memory_decrypted((unsigned long)ret, 1 << get_order(size));
>  		*dma_handle =3D __phys_to_dma(dev, page_to_phys(page));
> @@ -171,6 +178,7 @@ void *dma_direct_alloc_pages(struct device *dev, size=
_t size,
>  		*dma_handle =3D phys_to_dma(dev, page_to_phys(page));
>  	}
>  	memset(ret, 0, size);
> +
>  	return ret;
>  }

I'm not so sure about this part though.

On MIPS we currently don't clear the allocated memory with memset. Is
doing that really necessary?

If it is necessary then as-is this code will clear the allocated memory
using uncached writes which will be pretty slow. It would be much more
efficient to perform the memset before arch_dma_prep_coherent() & before
converting ret to an uncached address.

Thanks,
    Paul

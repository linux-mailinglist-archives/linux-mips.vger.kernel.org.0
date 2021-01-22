Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0C42FFB07
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 04:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbhAVD2z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 22:28:55 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:58274 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbhAVD2o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Jan 2021 22:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611286122; x=1642822122;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=+jdDUSqyTNAyWg7uzn6k+9f5Dm7rOBsKT2iqMdb29IA=;
  b=b+pshJuV9B2oDiW87WBnqTUNNC3NGjvStuIUpFLDbimndxf9gv8IunSG
   jRjnMgmEaQvDrV4tZZ3Ji5YQhQLHo2qkGWqb/CwH49QvN7s5aUkYbhyt9
   ZRYMvx+cP1sUfiXBC3jZSH7aUzKo72Hij/reeZlzgaj/+PUxN0hq4Pg07
   enQXtbHbFhD8YatqCPiO3W1d6PMcpBSLngcjRKrWmblw6v2HnizVtjyH4
   QGPHgpo6bZQlt2Jn5XlRNTg1hFe6GQiGGHVOF9wOBEdBVhe1a3Xonr9MW
   J1tGdl1tP4K0qlJDf5CeEeI9l18Dqh1xGWwjUM5nAhStNiy/F61kqWYHZ
   Q==;
IronPort-SDR: BPEz+xJDyo07tD7DrN2c+DRmaQ/8Dp4HDA8pxqWHuZQ8qLODRbALD+I9QwPqR0sOrFilIJqk5Y
 X1XD9IvQwpb7G+fbm/QmM69rL1jL6yt9Rb2I/MUiflPRVGgCe4LSRt1N/6Ehu/8KdpHlgchwNU
 bIpFyD+2yekESB5kXBPeyXK2K9qCKLzR+A18Dt26Khg4TkPl43DRgOonlIvCCHHI1N0gK5szKS
 fX85FzsNzCZMeKAucCHgpzwDDj6fKbhnVoAH0t4FSEKGTZkHSNsLq3VkStJ8LOSgWlpOn2Ik8D
 1YM=
X-IronPort-AV: E=Sophos;i="5.79,365,1602518400"; 
   d="scan'208";a="162490303"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
  by ob1.hgst.iphmx.com with ESMTP; 22 Jan 2021 11:27:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQu40SG3JfTfD3F6BW+O6v1hYy6tBA/1GW3F1jo7HBk4dsqseOKiUf+ISWYwgYMmEAvenp02kHUNUsK+n8k4IJQdckUNCQ++UPMArf4gcPPb7PHrfEnOeZAM9KY8d8OGTWfIFuN1pLH2wXfup2i3zVwnyrj7si3BJyMH8jwy0zJV8sR9bKp3nK0wSFOqKFBYTgNMDIStWeoxKy3phNF+dupLa2QmguFf9G3DJK6XOjPPob3tjYgUwDjDb+4M4CKukc5RriwNF9OpuWAzGd2MJBTnB93gqgsUJgOgXB4eHWEmogu0eIwXcbi9qfSEalff1n11yFsDY4qqG62wd4RMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNTLGbT4PBhPT8QRtbu2UwfhVOy2Z2i+jPiG2dI8X5o=;
 b=lwVahHOIvDa9i+YhX/s2Vt/nNwYxpIHpqaUWox5mAkMgeoy+PCSnTWpAl4xRbsudSNeEyaekhspXIJQgnu4w2nrRsYAJAfgfql2AVJ4/E3Vay9hYIhkjxxEKRQANtMDYXRDZhDjDswrtKzYugIdciJVDYL0rvcThawoKhS0HY1Z66N/IOlfcMBjTplhtKPRSw2YA7M2reL04CdDdFn+RwdN1FhGTI2tgsfYo/eHVOfCawGDyviX6NYC+71dypk5usD2a0BBtDKOPmmbip0BVXCgjP0HM3MCCsiQJ27LlsnTufxwGmyzX1FgBgfDBadeCJ2+sHdoEGUXKBycsfVtGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNTLGbT4PBhPT8QRtbu2UwfhVOy2Z2i+jPiG2dI8X5o=;
 b=wusM5dY5TaK4Erinm72Lb+Fb/5IU95IARwoG7pCUiSHsGQyVK2crnXrZqkmoBtKijtEheyPmgxqSE7remtfUOAOvmeXZEKsPxdEq9CyCDlKqlwnQggYJYMO1sAVma+jSopHurtCoy7sLuQkWQqd97kwNEj0+ImMpWHj6h4pLAmI=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by SJ0PR04MB7693.namprd04.prod.outlook.com (2603:10b6:a03:32b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 22 Jan
 2021 03:27:34 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::716c:4e0c:c6d1:298a]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::716c:4e0c:c6d1:298a%6]) with mapi id 15.20.3742.014; Fri, 22 Jan 2021
 03:27:34 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Lauri Kasanen <cand@gmx.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Keith Busch <kbusch@kernel.org>,
        "hch@infradead.org" <hch@infradead.org>
Subject: Re: [PATCH v8] block: Add n64 cart driver
Thread-Topic: [PATCH v8] block: Add n64 cart driver
Thread-Index: AQHW7+7j81o2oc19D0iSKgHpidQYvA==
Date:   Fri, 22 Jan 2021 03:27:34 +0000
Message-ID: <BYAPR04MB49656861E46CB9ABEBE9069186A00@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210121130205.d2810df601bd00536195c87b@gmx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmx.com; dkim=none (message not signed)
 header.d=none;gmx.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2600:1700:31ee:290:475:2d41:83ae:3ed5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3424de97-5a59-4373-97ce-08d8be85a89d
x-ms-traffictypediagnostic: SJ0PR04MB7693:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR04MB76932728238071CBE031D41E86A00@SJ0PR04MB7693.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xtNZQLTEdOxBFNiRTS587AYAb/8KXkqK6WJ8ielDFBimhj6rEoek276z2bXft3F0x8qNapwA2Z48HAqn67BceY9ytmwq9fCu7wFNbFXz/UImGRSbbW5XBO/qJ5+j2Xku+WTil7hwGMjMl4vp3RlhoEICZa96kBG1d3HtaOY4axHJUsUgUJsUP3dlkPXsRTx+834LH2QQ3hmQ7KQvmABoIE14fLFH2DGB0JJA3AVYTaJ7AZNgvT/VW4fgdrKA3lZYjMvC7jgo7bPIIxpIV9xhikGPrOFqXJI+Cq1BYWhnlynNrgCQCC5w7HDvZ32ZIRaAxSNw1VJiOCocMViu7Gp32fdmDTebXoNHf6V8cCjZI3gyZAZxuhMiUb+4MaJEDpLw/bM8ZiD/4cK4L0aF0CEzqA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(66556008)(54906003)(66476007)(478600001)(66946007)(316002)(7696005)(86362001)(83380400001)(71200400001)(64756008)(9686003)(66446008)(4326008)(33656002)(2906002)(55016002)(6506007)(8936002)(52536014)(8676002)(5660300002)(186003)(53546011)(110136005)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?KCZWCrBrTJqjXlp+OWfyY89EJ3aFtpzViHxVxkRwEIZ4NnXdn6ochAbD1S4n?=
 =?us-ascii?Q?1J/2GD40F9xNrWTErQrgpW1K5De5U5TdE0vtTOoJzZW3T8dfvdYBlzUa1/UZ?=
 =?us-ascii?Q?d+m87m37Hf03I0VA6eUku5DFDWIiPLpjNyypaRzhtO25x6oNcliAbvzcvrS9?=
 =?us-ascii?Q?I984lPn72Zj+aD8wBh7XgWT35K6KoJsa10dXGwQjHCclRH+2hywTVfNpTOxu?=
 =?us-ascii?Q?icyv6kFlpj0mxm9iWHtvNFXcavip9hV5YmAD5vfs7IG+zXzI7jcG67lAv7xm?=
 =?us-ascii?Q?L52nYtOXN4Kt6J+zuwPcIFbO0jCGvaBAkgXiRhNsxnx1cB+a6LyylcB3ir+Y?=
 =?us-ascii?Q?/8SGsiIl0JS1L9sdS16OW2i5cXbMacgJresEYc/bGsHhj80qmJhAoP1pbboP?=
 =?us-ascii?Q?hjjg6sNHHoWYSRA6imRrI4nj5lXhyaxThERV2rXKGEexqelzCH/TSJ+cdElQ?=
 =?us-ascii?Q?ULGYFTFZKodoRdfFxlH9vuavGWrB9V+tkR20WUK8roY/NulG6klbY4Uhoxv5?=
 =?us-ascii?Q?f5vJtrfPQUuqZQK/H6n35SCuLzR6FcIy71iGCtVsBATJRKo9P6iRBR11slLS?=
 =?us-ascii?Q?mY6y6vjPR1zdPWMm6dsO7QWBiIpm/SrjpeBz+P8vONgaflmEAFvhJZ36n7c9?=
 =?us-ascii?Q?1SS3SuXJX+AMeUMAn8g38XunuQ89asFmnMZuiUhZgS7+GOC7PTdY0VlKGTmB?=
 =?us-ascii?Q?tIKG1VgeLvVAAjOzK9Vm8nc1rpzk/RJUvb+yUc/cgx249XzaYoSY/F5+O9n7?=
 =?us-ascii?Q?N+8Ss4Zng2BVKVia3/qzCQ86yl+Osjj9xZdbczjzrQU+B1bDSXrzZSlM/UFP?=
 =?us-ascii?Q?ZKA7cQxIb7FkoAgIgesBc9UOQfheNIi72JkrK9U3lSFdGT0yxxlQfqP5LKqF?=
 =?us-ascii?Q?IAAdyNHoizewW6wId9g5Yqr0C4Fd4sfzakf+Aui1IToUl1K6RpevsR79BSn0?=
 =?us-ascii?Q?KBMac9HEPEtCuFSMnq90IZ6bD3sOsigCQB2uiArFexhOxfYHgBLrOhaNBWCd?=
 =?us-ascii?Q?286/tmoW0OWs2mcmh/QEjOPm9BlmKSIafntFTDVSjz2NOCoveNlDZdljgXu7?=
 =?us-ascii?Q?nhidMRGv?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3424de97-5a59-4373-97ce-08d8be85a89d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2021 03:27:34.0620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vnD0ccAh1sZJ2z1aHBTY+ZFzxN4ugArI1O/qsotbd+dSCUObtnlO6D30Cg6WkyyrGPwWGHTkXXBodf78+i9LTTW5scYpu/TPsJa9ptG2RUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7693
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/21/21 4:13 AM, Lauri Kasanen wrote:=0A=
> +=0A=
> +static blk_status_t get_seg(struct request *req)=0A=
Why not add prefix to the above function with n64 just like other=0A=
function. Also,=0A=
to me name of the function seems a bit generic, can it be more descriptive=
=0A=
without being too long ?=0A=
> +{=0A=
> +	u32 bstart =3D blk_rq_pos(req) * 512;=0A=
> +	u32 len =3D blk_rq_cur_bytes(req);=0A=
> +	void *dst =3D bio_data(req->bio);=0A=
> +=0A=
> +	if (bstart + len > size)=0A=
> +		return BLK_STS_IOERR;=0A=
> +=0A=
> +	bstart +=3D start;=0A=
> +=0A=
> +	while (len) {=0A=
> +		const u32 curlen =3D len < BUFSIZE ? len : BUFSIZE;=0A=
Why not use min_t instead of conditional operators which are discouraged=0A=
in the=0A=
kernel code. (this is coming from someone who got yelled at using ?:=0A=
multiple times :P)=0A=
> +=0A=
> +		dma_sync_single_for_device(disk_to_dev(disk), dma_addr,=0A=
> +					   BUFSIZE, DMA_FROM_DEVICE);=0A=
> +=0A=
> +		n64cart_wait_dma();=0A=
> +=0A=
> +		n64cart_write_reg(PI_DRAM_REG, dma_addr);=0A=
> +		n64cart_write_reg(PI_CART_REG,=0A=
> +				  (bstart | CART_DOMAIN) & CART_MAX);=0A=
> +		n64cart_write_reg(PI_WRITE_REG, curlen - 1);=0A=
> +=0A=
> +		n64cart_wait_dma();=0A=
> +=0A=
> +		dma_sync_single_for_cpu(disk_to_dev(disk), dma_addr,=0A=
> +					BUFSIZE, DMA_FROM_DEVICE);=0A=
> +=0A=
> +		memcpy(dst, buf, curlen);=0A=
> +=0A=
> +		len -=3D curlen;=0A=
> +		dst +=3D curlen;=0A=
> +		bstart +=3D curlen;=0A=
> +	}=0A=
> +=0A=
> +	return BLK_STS_OK;=0A=
> +}=0A=
=0A=
=0A=

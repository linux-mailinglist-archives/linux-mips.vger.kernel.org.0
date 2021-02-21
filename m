Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D143320E0E
	for <lists+linux-mips@lfdr.de>; Sun, 21 Feb 2021 22:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhBUVwH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Feb 2021 16:52:07 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:7885 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhBUVwE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 21 Feb 2021 16:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1613944324; x=1645480324;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=H+niEGIkNJX+N8YTN4cVm+fgHFeLdZfW2uDRhlCjnLM=;
  b=E879opZTkzsoqC0oDmATxA7KWKXm0zKCaBc5KBlHoMAwiktVuYDUByzB
   Sz25KfwLLJR+q8nHZyeq6u0IL+6+e5BczfxVcvD5yd1baizeimN32vZFq
   T3hhy/D+kbkeDg95/VbnIBBDR5GwQtLoCgv/Ca53HN6xrSymAdgcfht5z
   YY563Cih+gkFARtc/SVtPbAOBJJMj519KYtAA2baxAZ0avflGGGcR6kLk
   +36c7o98i6qqnBiCZiOgSsSpek/mez1q1cOFKAerI5ibAWQsvKshGLf9/
   NbTqXujVHMqzkp44GFElPKG4PYnakHHD17Vw6FI+EatVZ3iC/Y1W3OSGl
   A==;
IronPort-SDR: T+weE8m/LKJVyCKgHu88maDyMrASK8Eq5tgLT4c3zbRoptUauiY5/3in6ba3AIcsPnUWSAEwIK
 X11GEkFVNtlreqh2V6Z64Y5o4xHLRk+oZADWRnM9qtgoDX6qdqq5uirG5Roe31Lab+ax6SW8Se
 8ZP7hwPNs/4PSECQYIlsnbxMm847PLPwo/wX3PR88SGjEtaVU5Q+xSavPf1UGh62sIyjg1iPY7
 905uMxhHBi4pw14AYPGKcazRYIpoJAVbcDoCpfrCz9KFD/PgjOLGx9vDmmH9KMmXOgyzimTo8r
 hyc=
X-IronPort-AV: E=Sophos;i="5.81,195,1610380800"; 
   d="scan'208";a="164936580"
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
  by ob1.hgst.iphmx.com with ESMTP; 22 Feb 2021 05:50:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMjXVbrdfchNIQDXfbHpjkiY3H3IKKFaAtbaFFT+/O5vySLy9RCcdlQHG8rbCqBI5PkSgdG88UUk9//VB2JagkuXpXrX909aBtLUzmlljp7CcNeqFJmRiFb8s1Aua4wKBpWUgelfvSNIOX0+5Htcxb1ET2YbpH9xSgTlzMeibWqp7kbzlRe/Qhqirq5+n3L4nE5RMMEalkWxuOXgpiFyspB9gEnvyw6RVPf5nY4sddlaSebPufG/5u7L4PYst+L6IZrvTd1vyxJieZwIyt3LOcRd0V84gTRtcQfDYTnmfrSiArSoPNA8fW0pbRbFMB44zu6S5VgajiXp+Bc19DpviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+niEGIkNJX+N8YTN4cVm+fgHFeLdZfW2uDRhlCjnLM=;
 b=UbnbKOCvcKo1ZrJna0VIG0SUTmv/cp8T2FxbVGyTg9EOTo+EDBtz8In9foUz8VJ1JPEOw4siG5hHhJpeNg8gzTfUTmF9ReoLfi6Qys0mCXrEblGsvaHj0FvIorFDXYlhKVLoTtKOn+GAfUi8FQqvHocLmsW5VV1WklQ8FiUaZclLv5t7NysiKqRsF96YDpi8Ozenxnpv+LfHrhVfrtNxBFUzR64kFNDHffnSlqPNrrCHoOx2Lps0Bb1YfBwiQTaiBXRDtPeuUqa8bYP0bTpzWL3G/oQyJHOY9Ji3bvBzZSDbwHPRU/RX27OIe7pa/kitC4lm7N72S9TgzTbFHpy89Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+niEGIkNJX+N8YTN4cVm+fgHFeLdZfW2uDRhlCjnLM=;
 b=LjdqlR3BfxulLELtLlpaI0s8eTxms0h3446FCCUpecUeG/XAqegs42CTAGmhKPeHmTo+b2CHdEQg8FIGbzTQFMKsLYFGucVxxhSplYvFfN3YzXW73Sm/VGwq/3ANx0uPrNrZBkGaNEHfztLG2wKbfRr+5kL5QFclydfUL3NCP6w=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB6248.namprd04.prod.outlook.com (2603:10b6:a03:f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Sun, 21 Feb
 2021 21:50:53 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3868.033; Sun, 21 Feb 2021
 21:50:52 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Lauri Kasanen <cand@gmx.com>,
        "hch@infradead.org" <hch@infradead.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v11] block: Add n64 cart driver
Thread-Topic: [PATCH v11] block: Add n64 cart driver
Thread-Index: AQHW8V0RPSwnc2UUP06/pmxPHYESZg==
Date:   Sun, 21 Feb 2021 21:50:52 +0000
Message-ID: <BYAPR04MB4965BFF7733E47FFD159435E86829@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210123095327.58e5ab6c05f38e9080a79bd3@gmx.com>
 <20210123124210.GB458363@infradead.org>
 <20210206192837.5ecec54cc5ac120ade1d5060@gmx.com>
 <20210211102314.GD7985@alpha.franken.de>
 <20210221085421.882c8f0b8b51f44272beb471@gmx.com>
 <6c003ea4-2d4e-c50a-25de-00f3ed55b0c2@kernel.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alpha.franken.de; dkim=none (message not signed)
 header.d=none;alpha.franken.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 144992bb-c6ed-4937-77fd-08d8d6b2c271
x-ms-traffictypediagnostic: BYAPR04MB6248:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-microsoft-antispam-prvs: <BYAPR04MB6248D9B62589264D1A85086A86829@BYAPR04MB6248.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FW9j8ZoNDpegi6Cr41cd/lG3bS0lIytVCMRDRmrWDkgU67WOUxT5CSQoRoJGcN3XwfJA1ZLVGqTbqaP8AM2Cdp/EQLHl3cA46HyV2iqtPTkl7QdXRtsfdPY2PCc2BSG7ovk2Hjg8D1UPTQNaC6/Q9bJXctD8JWituZW9nhnWso7q7f0RdqL67O4zCT90tI9N+TEnnzJrFup0suyCuflRsuFRrTDRxBpxOdEVYqgXJ/XI/MjQv5jQIYqRMH4Y+tWe08r9a3Xv3kP6A4wSWQSmBAV/c5K+wzWpA1BEC/xHe4Nur0wfnbRXatqwmZOvLuSlTQE0B1E1yoDUoOtknRWplXnqq2FiOW8KQ5/9X3kvC/gHxgzIr4VrDCvMz/jDOx6aMxrPpZXQcsSrFAQQX9bihk0dy4V2C0KrIUiqrQ3R2KTszJDWl6TdKyP93H77fXQOlbvTl+z9sIYEgTrsVgckzv+eaUwyw1IC7CdQnkCVLoNBL8FdoR+GDXIQowvVfJHL6tEOn3LJMewz/+ROJJK6dtNP0IXb9uCWN3sYH7uTxh/6Lt4uuldc9Nmt1XhyFZFgsuHsuIy6mPoGwLgL/7LIpmp1AQ0RXxPuPE0ICjdefsU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(2906002)(71200400001)(83380400001)(316002)(966005)(8936002)(8676002)(4744005)(478600001)(33656002)(6916009)(54906003)(186003)(26005)(52536014)(9686003)(53546011)(5660300002)(7696005)(6506007)(55016002)(76116006)(91956017)(66476007)(66946007)(64756008)(66446008)(66556008)(4326008)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?G8+T3pAApbl+iue3fiFzhBS8fXbcaqeQiceKXjLhAdJY8rs8SIPhFPt9nwVc?=
 =?us-ascii?Q?eIvwjJJLiYLFgt3tLbMqhtRmWJi3M4PphkbMbN5Loi9rTsYtgiznCAh2YbCq?=
 =?us-ascii?Q?u1qYvGrtHq4Ya8t2/5TwS19JMzyK350dwNDc1FJs3rlyrwgReEPJDrF3yweO?=
 =?us-ascii?Q?fxLfAlGAXgqxsmixySoKOK2vaHznMfklRvLZTAYD2s6QzAdRVNNpu9sVjkN7?=
 =?us-ascii?Q?ng619a1K1vFL++FDy6Kn1dkXPmdVbLjFJAvLh1cKNWVNsqX6T5pXW+Rqkh2Z?=
 =?us-ascii?Q?5IRdZHwHSiQRiUwS68Tn+Ql1FhIRDnSUHK+1jjZ62bC5IGsVqWbbSjW7NnSD?=
 =?us-ascii?Q?j/KIKgDxE61MDTzKyiYJ4MlW17FevGVbveiIdM1fydngu6EWhmL3+uc/IE5n?=
 =?us-ascii?Q?/F/Kb9oPW4HDBfibuM5bRqPhjA01eykIdyqTwVO13qtQGM+ynAp2JH4LrZzY?=
 =?us-ascii?Q?r1ZgU+/S+OMNGhcAyzT42d8QF5qSHhZyOSX2tFwsO1XRwKJ5JQQPRmh3XreE?=
 =?us-ascii?Q?qF8jc60/31sIF9d7wfy/gZ2bdgPJNnxB0HrpLNdph1ZE0aVRtbyuTYLs1f8h?=
 =?us-ascii?Q?1Len34a5OxD4ZzKgNedRJAKIkeEr9h+3CS/m/Pp/I2HCce9dI5JMGtssxMMN?=
 =?us-ascii?Q?i7SFyxkNeBOgBSL37xQwUPvOuh0epbp3aHgahqqrmrd8DV4SQJDrq44VnTwn?=
 =?us-ascii?Q?yVg6US1OZ3o95+X7gSDwk65ef9HvDD1kFCGjPCiH7cKvrw+fI2O5K0Qf0Mt8?=
 =?us-ascii?Q?ess5d14tEdClmMkTrbA8S+teSVQ6qPjvuORO8A4qeXmY6WfyIbVHG+lUMu7X?=
 =?us-ascii?Q?KHg66NlNA1ED06JhL1VF3hqHkP3/YGaLXtwppTcmu3xDzb9fxMYfZjsrE9D1?=
 =?us-ascii?Q?akjF4qTJwtx/jwjKOabXfMDfog/brRbmd5E/5VIcitsIlYtdbu2bjnBMkkfn?=
 =?us-ascii?Q?m0y/qt2dkPtmezUSE5gkZMT9o7zs7YX2aSvUKMWADpl+Sa6I6ZugBgqyxNuY?=
 =?us-ascii?Q?T1N2k7rFAwdumbHfw9DAATjEoC4U2fLYm/6vGHX6Ho23AhK3aTeRZX/mf9XZ?=
 =?us-ascii?Q?MfN06v2O2cUsY2scYRcsu+uSaumSqnqQvkqutOTI33fJkIUjCS5fi8sNEBo2?=
 =?us-ascii?Q?E54yaEYwfklbH9pGwS5roKq4ZVkITql//2c2Pj52dajAsUnhm5TOaNKB4jnG?=
 =?us-ascii?Q?McHwYCwhPpkHF/jsOiOl0QKGq0NGDaHe67AB4oMBodTJyEBxCS67tpH1uUBK?=
 =?us-ascii?Q?6WoRjlpckpY76mrbzK9XLi5fNTbrC4v2/tUVPOzqszRV3s6G43EMbUP5ZCJy?=
 =?us-ascii?Q?JX/xpzVk3srzRbfjcAFoQMe/?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144992bb-c6ed-4937-77fd-08d8d6b2c271
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2021 21:50:52.3526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J5NN9NmUgfPxktl4XGpgqi9rkNI3kYK+Lx0uCYqZu7YWM607MhNLKD7VP+WE+sX9gIMcH1MtKhFv5ZXQ89We5nlTXu8Lngx8OAzhsxGy3uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6248
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thomas,=0A=
=0A=
On 2/21/21 05:16, Jens Axboe wrote:=0A=
> On 2/20/21 11:54 PM, Lauri Kasanen wrote:=0A=
>> On Thu, 11 Feb 2021 11:23:14 +0100=0A=
>> Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:=0A=
>>=0A=
>>> On Sat, Feb 06, 2021 at 07:28:37PM +0200, Lauri Kasanen wrote:=0A=
>>>> On Sat, 23 Jan 2021 12:42:10 +0000=0A=
>>>> Christoph Hellwig <hch@infradead.org> wrote:=0A=
>>>>=0A=
>>>>> Looks good,=0A=
>>>>>=0A=
>>>>> Reviewed-by: Christoph Hellwig <hch@lst.de>=0A=
>>>> Hi,=0A=
>>>>=0A=
>>>> Ping on this patch. Thomas, do you want to pick it up?=0A=
>>> well that's up to the block maintainer. I'm open to take it=0A=
>>> trhough mips-next, but then I need an acked-by for it.=0A=
>> Hi,=0A=
>>=0A=
>> Ping 2. Jens, I know you're busy, but just a mention this is on your=0A=
>> TODO list would be fine.=0A=
> That's fine, you can add my acked-by to the driver.=0A=
=0A=
When you get a chance please apply the following series on the top of=0A=
this the driver :-=0A=
=0A=
https://www.spinics.net/lists/linux-mips/msg03296.html=0A=

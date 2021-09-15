Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FE340C6A3
	for <lists+linux-mips@lfdr.de>; Wed, 15 Sep 2021 15:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbhIONvW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Sep 2021 09:51:22 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:54864 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234212AbhIONvV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Sep 2021 09:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1631713801;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xRs3iwL2GN66k/6W48nYP2N7/4zO4rIJIIkNfYSSLuQ=;
        b=NW1bdbCVYhSjCIBgindKLrw8TGhsMXaLqJ0QkhLrug2lzli7KxSail3HXiYj42aoqFdmFo
        NXzeqtK7C8OmMZ+2APT0krvz8Sn2f4rFBlvwLGDzkKmO8XutDzXXrTFxN9HrCYha+oWw4m
        DPftBR+RF3LeH56BHGejaO3XqD0VWZs=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-WzxKjQ_FOyCp9ovxI31h5A-1; Wed, 15 Sep 2021 15:50:00 +0200
X-MC-Unique: WzxKjQ_FOyCp9ovxI31h5A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8lt9p1Y+LIdUdIgr3fuIzarCZseiGSmYopU30G98+zDs5fp8kr+3twLEoIAcdiv+ka28ZTfxgcTHkGTMxrBqvYpYjx1MHs7jK3ZmZTos43BXkCSuPeRbHKh2hFmmSMFzZ4dcpkaQOJXH9jVzXT16OgriX01UKvToVcVfM15meWUvUDtVZwkNk+BV9q16Wx/BBKPGB8IuP6/phvRsLiyBAV+aXIoQhLnsDoKv/eFi76IuvpcBkb3T8nQsKZo3iDnpNgnHNpd7ZFkzLu5jAa/Mr5G8uzzgik7XKPtZTlxbfRAAq0ZAMUGs5fVSp/ccjgPN3tHo75an6DuYDu7IzkdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xRs3iwL2GN66k/6W48nYP2N7/4zO4rIJIIkNfYSSLuQ=;
 b=hKb/3wEDzOgnV/lOG4ccZJk/VLhvDji9RO9J29oqaWtt7jrqqabQAy5xJwnxbFUpMIB/PpH8XcBDUc8c0sWqtAv4kWqbV3Fj8MIZn394lkPvohXzl9vJRq28Eukaa5/6KfH9EvPYWd1Ag2Vmu5LjYncxfwKiBmucvWmmPXry1a/fjVlvkt48AdY9yPMHJRmr3F4mYTroB/plskIYjsgYQzathTtAFRkL+pxT5MW5iCcgTbbTqpnHevAvkdMVf1y5N5uNZavsLIyv+xvY3h2y91LXfTi4D42g0TG9jVoVtPYM16l5Sn4cf7VA3GMQJeTVhR4cgVbX1U2pl33FT+WBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux-foundation.org; dkim=none (message not
 signed) header.d=none;lists.linux-foundation.org; dmarc=none action=none
 header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 13:49:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 13:49:56 +0000
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
To:     Roman Skakun <rm.skakun@gmail.com>
Cc:     Andrii Anisov <andrii_anisov@epam.com>,
        Roman Skakun <roman_skakun@epam.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Mike Rapoport <rppt@kernel.org>, Will Deacon <will@kernel.org>,
        xen-devel@lists.xenproject.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        iommu <iommu@lists.linux-foundation.org>
References: <20210914151016.3174924-1-Roman_Skakun@epam.com>
 <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
 <CADu_u-Ou08tMFm5xU871ae8ct+2YOuvn4rQ=83CMTbg2bx87Pg@mail.gmail.com>
From:   Jan Beulich <jbeulich@suse.com>
Message-ID: <84ef7ff7-2c9c-113a-4a2c-cef54a6ded51@suse.com>
Date:   Wed, 15 Sep 2021 15:49:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CADu_u-Ou08tMFm5xU871ae8ct+2YOuvn4rQ=83CMTbg2bx87Pg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0117.eurprd04.prod.outlook.com
 (2603:10a6:208:55::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.236] (37.24.206.209) by AM0PR04CA0117.eurprd04.prod.outlook.com (2603:10a6:208:55::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 13:49:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0b5e282-5bbe-4cf8-0b58-08d9784fb384
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB547110D274360FD3C4EDBF3BB3DB9@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JaXuFuBrcOfmQDdigdiyDseTXDqzxqZ7D+OcJ7e/NQ+4HjxSamTqC9C19d5ApqvcR/PDEdRLfdfhifzsV9l671gOEtQtTIEsAhDvnq/viB4PG6hhzTfB+Q9Ej1LW49ei01J9zaYHRpwtXByUqn5Pm3rgGgtNhMfAayaC2kHZeVbDz47zabRgCnp8KraclUERRxsfJ0RNkm/XfMij1ZmFTCMQeVAkGPokjTs0lVWfdcMVtfFTWDQg9Rj+fJRIeH81EhqfoxKN2euQJn7HgrCV4ZPWKWpRJuONkU2InfXd+PyiHJKEawjtzx7qOulUeqBaUkAosyES+N39BTZdJkySWJmHZD8r5rSMLbN9O1ouql+ZyfyAihRWE61PACdHUGXRbkmZMqzFyNx0QXHDiI1WrYm4bJ+Ex041VsHkg+ovDguBIlXLIBSfD29CIOCHnkZGPte7jq7n1tnxKTqSrJMcA5JGb3QpemVpHb+mLj+9vUbzFeZNZ/AnAXeqxh3j+arIy7QB6lOZIDkDgivSgoCJvPXHSgPSXWvSqmE6f5SQ66rx76a4pxTVxN+DPTcKCIkwSoU2tq1pQ2YsVABmQBBWk21/V2fr6Fv1IXcX1KE9ETjYPsFojGghKHVhuetvgUcO9pUMqX08hKTWYTrUle9V8/ZwV8i3Gac2fydBxqrZBYObxvXrfHiILcTc16+io0RhRZH5toDLEnwN5JT4di8ewmoKm5ALp+hhKR+33br6ZUrEn5chGDsUp8SUfEZ4Z+Rbj8qd1d8O3OvjapKWSyHry/1LrLPPQQ4sporNAztzyG3E5K2cCt5M1jL3qvKfIsz3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(39860400002)(396003)(376002)(2616005)(53546011)(8936002)(38100700002)(956004)(31696002)(2906002)(5660300002)(7416002)(7406005)(16576012)(6916009)(6486002)(4326008)(31686004)(316002)(66476007)(966005)(66556008)(54906003)(478600001)(36756003)(26005)(66946007)(86362001)(8676002)(186003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFRidnlrZWxiOFdDZ2lIcFMwTUR2cDVUSGVSbVJUdDlsYTN2elZ1UzRGaGFq?=
 =?utf-8?B?RFJYcGQ5NDFkMFcrSkdUd0J4K0IrVFVOZGZBVTlGYURMZitVbVoxOVR6Z3Vr?=
 =?utf-8?B?RlhNM0xZUWVESGt1WDRIK3QvSUl1Y2xKUEtuemo5bW1oZC9YQTNFVTF1bmpv?=
 =?utf-8?B?cDRGakh5clFrY05TYW5GV2ZNT3dXOGdrWjIyRXphQXY2bmtkZ3NzVitOT2ZC?=
 =?utf-8?B?ZDVtb05VQ2kwYjJJQ0VHcjk3dmY2Ymc4Z1dSVzk2K0lheDdPaGxubklneXRD?=
 =?utf-8?B?TUxXMkxEY3h2TmV6c2ZFS3RJNDhlb3hybWlhcmlkM25EaUdLQ1E3WmRMNmlE?=
 =?utf-8?B?ckFUSDdPdmtwRXkwZzJrazlQcnN5U0plWFRqMTh1NFMrS2h5MnZ6a0ZsOEw3?=
 =?utf-8?B?dHNuaml0dUxiaDA3M0JyNWQxTnhtWktNckhiekNuYTRkOHFMbGhLZTl1TzdJ?=
 =?utf-8?B?MzRNcko1WVpwWGhwRXVLbEZ0K2toL3dlLzcyTkZZbFMrNUZaSzJSMDRRU0Fj?=
 =?utf-8?B?R1ptWlJYZFZzY0JWbGZKUitQK2M4bUxlWDYxSk1pUkM2UitrQStlMUw0NUs5?=
 =?utf-8?B?dDBkNjViazlsbWIzOHAwMWhEVlp2OUE5TDlrU0lwdk9TblRZbDNqeFl0Zm43?=
 =?utf-8?B?TnVJSDh4ZWl1azVlTmswU1gyS0dUQkdQdFBZbjJ3bUZqMTF6bnh3SHU3QzNn?=
 =?utf-8?B?SnQrRC9aYjhvL0pKeEZnRVAzSlBsZGNvMXdoQjNVQW5KRDY5aWQrTllHOWhQ?=
 =?utf-8?B?Y2w2d216aTBsNnlqSFRXUFF2WWlEQXdJUmtBYmI3NnNnejhMT01RS2JXQ052?=
 =?utf-8?B?d1lZWGoxeXRxQVVOV3hqazd1MW5LZ2x4dExIQ2hDVW93RVZaeTJudDFBcFg4?=
 =?utf-8?B?UmNrMXZKaE9BaHgrZ3NPWEhjeVV2dFNkQmVUYUdsOC9BUUcxd2U2TVhORzJx?=
 =?utf-8?B?RE1tdWFmSkp5ZVJGejdBVXpMZlFiM2VnclN5MUY5SXd1a3E4eGRicWZ2dVRa?=
 =?utf-8?B?cmxtQUt4UVpOWlBRL25zSVdjWW5QUFR4cTgrNVkrS2pqK3dsN1QrODFyYi9t?=
 =?utf-8?B?NGZHd25KMjhkR0FscVlaaWNFMU5XaFhCSzlwbk5tV0pVVkFGRnpZK3VHTHIr?=
 =?utf-8?B?Tk54RjhyNHM4dkNDdEE4OWg3bUptNGozYlJXTVNoVWNLSnVKUWFCWXNQQzNr?=
 =?utf-8?B?REwxcXdDa2k4OFNsVHJXcmVkSVl5cmN5Vk9rQnQwYm9lVjg0elFiNFBUZjRl?=
 =?utf-8?B?Wk1CckNFQ2lNa0FNaUFHMkJFL2FuNjdKelpMVXkyTTA2OVlDamlrZjE4NEVK?=
 =?utf-8?B?WnE5Yms1ZE15VDhCZDU0cWR3MTBaaElKS2Y4SDV5UmJEMll6bzdKL0VZaG1Z?=
 =?utf-8?B?akVmWmlVUGhIYURZMmp3aW1Lb1dwRFVQRGV2c2FmT0UzWmN0RmxKcytWRmpl?=
 =?utf-8?B?NGpEQjVxVHFtT3FqVyt0bTFLTGthOHk2clBKMVRneUpwWm1ib2c2RWtTU3Vv?=
 =?utf-8?B?Q3FzWm9rd0tlL2s3Wm1oOGYrWFg2alJXWm9RSGFJRlpTSVljb2I0eVF3b1hQ?=
 =?utf-8?B?anVaSFBWQk5SREdYcUN6bnh2M3FqeVBsRWhNeGJrV3NaMElOeHZ6dlIyc25p?=
 =?utf-8?B?MjNlLzRaQno4cytSdFl6WmRVemtTNmpHODY3TG9DN3Y3cjhxRjBjbGtZeGtn?=
 =?utf-8?B?RGwrMUVOeTNHcmM5eUczNnhTZk9nSXR3MzNLekxYVkE0eG5RajdkWTVIcjNG?=
 =?utf-8?Q?ks2N/7BOJPGoHLXLwSSryflzFMuSIcoDBOJ1ug2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b5e282-5bbe-4cf8-0b58-08d9784fb384
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 13:49:56.1019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xsr9MvRkno86dox0iUTJAb/T9srjz1uVr6ApclDgSHv1xh0ZjtgtBgc5lzh5cLO4IQl05t2yiSrGZuxLrCHJgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 15.09.2021 15:37, Roman Skakun wrote:
>>> From: Roman Skakun <roman_skakun@epam.com>
>>>
>>> It is possible when default IO TLB size is not
>>> enough to fit a long buffers as described here [1].
>>>
>>> This patch makes a way to set this parameter
>>> using cmdline instead of recompiling a kernel.
>>>
>>> [1] https://www.xilinx.com/support/answers/72694.html
>>
>>  I'm not convinced the swiotlb use describe there falls under "intended
>>  use" - mapping a 1280x720 framebuffer in a single chunk?
> 
> I had the same issue while mapping DMA chuck ~4MB for gem fb when
> using xen vdispl.
> I got the next log:
> [ 142.030421] rcar-fcp fea2f000.fcp: swiotlb buffer is full (sz:
> 3686400 bytes), total 32768 (slots), used 32 (slots)
> 
> It happened when I tried to map bounce buffer, which has a large size.
> The default size if 128(IO_TLB_SEGSIZE) * 2048(IO_TLB_SHIFT) = 262144
> bytes, but we requested 3686400 bytes.
> When I change IO_TLB_SEGSIZE to 2048. (2048(IO_TLB_SEGSIZE)  *
> 2048(IO_TLB_SHIFT) = 4194304bytes).
> It makes possible to retrieve a bounce buffer for requested size.
> After changing this value, the problem is gone.

But the question remains: Why does the framebuffer need to be mapped
in a single giant chunk?

>>  In order to be sure to catch all uses like this one (including ones
>>  which make it upstream in parallel to yours), I think you will want
>>  to rename the original IO_TLB_SEGSIZE to e.g. IO_TLB_DEFAULT_SEGSIZE.
> 
> I don't understand your point. Can you clarify this?

There's a concrete present example: I have a patch pending adding
another use of IO_TLB_SEGSIZE. This use would need to be replaced
like you do here in several places. The need for the additional
replacement would be quite obvious (from a build failure) if you
renamed the manifest constant. Without renaming, it'll take
someone running into an issue on a live system, which I consider
far worse. This is because a simple re-basing of one of the
patches on top of the other will not point out the need for the
extra replacement, nor would a test build (with both patches in
place).

Jan


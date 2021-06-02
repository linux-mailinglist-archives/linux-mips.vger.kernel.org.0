Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8079D398B22
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 15:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhFBN4w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Jun 2021 09:56:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49130 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229590AbhFBN4v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Jun 2021 09:56:51 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 152DaiWL008290;
        Wed, 2 Jun 2021 09:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=WmZjR7l62AhdoDS2RktXANR5nkORtTOgYHzx6ctUV/Q=;
 b=kG0JKv/BHTALc3tO3r5A13m7Xay13WCPa+NOcKGpk/mbNx8wNgZstAb6Z3Onmy/APSoU
 LJ0SuNz2jdsq1g3ymHLVt3CerXwq1O6IrUOSr1Sc2GTdvhbETJGoz+NyVNM2UQZHOu0r
 WPy+mmVUbcD0gZXWHuX3Fa0D20m+v0SMLU32Q1iYzhzyW/b/bmMuWKYcOqesOJRItgOF
 mjogp2RwJG0aZyEGnrkOIiw7vEIS0BLdLEXkc95neVeDkt6MRBGJ5VhiQ5FD+JW8J9Z6
 jbgRnB7EO9rLZ7ACN/kEweMvbYJapo72OaidBN4TUIu2ft6f0aYQP1VxwsLXrgoWsoyZ 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 38x92dm0s1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 09:54:29 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 152Dcx18017122;
        Wed, 2 Jun 2021 09:54:28 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 38x92dm0qe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 09:54:28 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 152Dlt2n024334;
        Wed, 2 Jun 2021 13:54:25 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma04ams.nl.ibm.com with ESMTP id 38ud88acyf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 13:54:25 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 152DsNhj27853120
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 2 Jun 2021 13:54:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F296711C05C;
        Wed,  2 Jun 2021 13:54:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E020411C054;
        Wed,  2 Jun 2021 13:54:19 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.77.40])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed,  2 Jun 2021 13:54:19 +0000 (GMT)
Date:   Wed, 2 Jun 2021 16:54:17 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: Re: [RFC/RFT PATCH 2/5] memblock: introduce generic
 memblock_setup_resources()
Message-ID: <YLeNiUkIw+aFpMcz@linux.ibm.com>
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210531122959.23499-3-rppt@kernel.org>
 <20210601135415.GZ30436@shell.armlinux.org.uk>
 <YLdCRoldZFYMZ0BG@linux.ibm.com>
 <20210602101521.GD30436@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602101521.GD30436@shell.armlinux.org.uk>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J1pL7ClAT_QwidlIsJz58cbv6Fart2RR
X-Proofpoint-ORIG-GUID: t-LdfegxWsAyi89ULkkDrRm0-GDDH0TW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-02_07:2021-06-02,2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106020088
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 02, 2021 at 11:15:21AM +0100, Russell King (Oracle) wrote:
> On Wed, Jun 02, 2021 at 11:33:10AM +0300, Mike Rapoport wrote:
> > On Tue, Jun 01, 2021 at 02:54:15PM +0100, Russell King (Oracle) wrote:
> > > On Mon, May 31, 2021 at 03:29:56PM +0300, Mike Rapoport wrote:
> > > > +	code_resource.start = __pa_symbol(_text);
> > > > +	code_resource.end = __pa_symbol(_etext)-1;
> > > > +	rodata_resource.start = __pa_symbol(__start_rodata);
> > > > +	rodata_resource.end = __pa_symbol(__end_rodata)-1;
> > > > +	data_resource.start = __pa_symbol(_sdata);
> > > > +	data_resource.end = __pa_symbol(_edata)-1;
> > > > +	bss_resource.start = __pa_symbol(__bss_start);
> > > > +	bss_resource.end = __pa_symbol(__bss_stop)-1;
> > > 
> > > This falls short on 32-bit ARM. The old code was:
> > > 
> > > -       kernel_code.start   = virt_to_phys(_text);
> > > -       kernel_code.end     = virt_to_phys(__init_begin - 1);
> > > -       kernel_data.start   = virt_to_phys(_sdata);                             
> > > -       kernel_data.end     = virt_to_phys(_end - 1);                           
> > > 
> > > If I look at one of my kernels:
> > > 
> > > c0008000 T _text
> > > c0b5b000 R __end_rodata
> > > ... exception and unwind tables live here ...
> > > c0c00000 T __init_begin
> > > c0e00000 D _sdata
> > > c0e68870 D _edata
> > > c0e68870 B __bss_start
> > > c0e995d4 B __bss_stop
> > > c0e995d4 B _end
> > > 
> > > So the original covers _text..__init_begin-1 which includes the
> > > exception and unwind tables. Your version above omits these, which
> > > leaves them exposed.
> > 
> > Right, this needs to be fixed. Is there any reason the exception and unwind
> > tables cannot be placed between _sdata and _edata? 
> > 
> > It seems to me that they were left outside for purely historical reasons.
> > Commit ee951c630c5c ("ARM: 7568/1: Sort exception table at compile time")
> > moved the exception tables out of .data section before _sdata existed.
> > Commit 14c4a533e099 ("ARM: 8583/1: mm: fix location of _etext") moved
> > _etext before the unwind tables and didn't bother to put them into data or
> > rodata areas.
> 
> You can not assume that all sections will be between these symbols. This
> isn't specific to 32-bit ARM. If you look at x86's vmlinux.lds.in, you
> will see that BUG_TABLE and ORC_UNWIND_TABLE are after _edata, along
> with many other undiscarded sections before __bss_start.

But if you look at x86's setup_arch() all these never make it to the
resource tree. So there are holes in /proc/iomem between the kernel
resources.

> So it seems your assumptions in trying to clean this up are somewhat
> false.

My assumption was that there is complete lack of consistency between what
is reserved memory and how it is reported in /proc/iomem or
/sys/firmware/memmap for that matter. I'm not trying to clean this up, I'm
trying to make different views of the physical memory consistent.
Consolidating several similar per-arch implementations is the first step in
this direction.
 
-- 
Sincerely yours,
Mike.

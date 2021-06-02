Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36CA39843C
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 10:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbhFBIgY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Jun 2021 04:36:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3892 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232681AbhFBIgX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Jun 2021 04:36:23 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1528XC0v128037;
        Wed, 2 Jun 2021 04:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=OChbxR6QjQTNTaJw3O9r3E6TSrBOAIRPYBMkKGpiDoY=;
 b=SyXVYahpZXMPUoil8JFYruuu6pb5UzmCv9CR0TkdfFv5jgQ/PwL1f1BDbJC6391B56Qn
 MVghHLEPe/SnyD14xMdCkNQo703uHZglKHo9RVRqMlTHe3HHihzfCHbA6hG1g0WGvSll
 QFyeC6A+sPxCd07/YVwr522UaDVF3+UtotbTfBnUonlnjcN1tLxLxuSypf/qPgp0hGCh
 P5jZFDuhf/DCqQTI8Z1tBTVAjIJNPZ6+pEj1Z7DKy6IK+FsEpzW+ODBO0XjiN64LjBZT
 zE8ydfaSeBCuyVCQfjjPspcqwpjz5Hq6UaclDtsjPNP9j16MA/MSS51kDJFZvCi2LcvG pw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 38x69mrgja-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 04:34:24 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1528Xbxa129470;
        Wed, 2 Jun 2021 04:34:24 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0a-001b2d01.pphosted.com with ESMTP id 38x69mrghu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 04:34:24 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1528TZgX020334;
        Wed, 2 Jun 2021 08:34:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma02fra.de.ibm.com with ESMTP id 38w413rjb5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 08:34:22 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 1528YJA331457654
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 2 Jun 2021 08:34:19 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 228695204F;
        Wed,  2 Jun 2021 08:34:19 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.77.40])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 1E18B5204E;
        Wed,  2 Jun 2021 08:34:15 +0000 (GMT)
Date:   Wed, 2 Jun 2021 11:33:10 +0300
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
Message-ID: <YLdCRoldZFYMZ0BG@linux.ibm.com>
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210531122959.23499-3-rppt@kernel.org>
 <20210601135415.GZ30436@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601135415.GZ30436@shell.armlinux.org.uk>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EcdhIARIYl_kZb5RzJtrpD2Z0VCkfrdb
X-Proofpoint-ORIG-GUID: f2BUAS44qSq1GOQ2K1GXFHBeNwTM8Rnv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-02_05:2021-06-02,2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106020055
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 01, 2021 at 02:54:15PM +0100, Russell King (Oracle) wrote:
> On Mon, May 31, 2021 at 03:29:56PM +0300, Mike Rapoport wrote:
> > +	code_resource.start = __pa_symbol(_text);
> > +	code_resource.end = __pa_symbol(_etext)-1;
> > +	rodata_resource.start = __pa_symbol(__start_rodata);
> > +	rodata_resource.end = __pa_symbol(__end_rodata)-1;
> > +	data_resource.start = __pa_symbol(_sdata);
> > +	data_resource.end = __pa_symbol(_edata)-1;
> > +	bss_resource.start = __pa_symbol(__bss_start);
> > +	bss_resource.end = __pa_symbol(__bss_stop)-1;
> 
> This falls short on 32-bit ARM. The old code was:
> 
> -       kernel_code.start   = virt_to_phys(_text);
> -       kernel_code.end     = virt_to_phys(__init_begin - 1);
> -       kernel_data.start   = virt_to_phys(_sdata);                             
> -       kernel_data.end     = virt_to_phys(_end - 1);                           
> 
> If I look at one of my kernels:
> 
> c0008000 T _text
> c0b5b000 R __end_rodata
> ... exception and unwind tables live here ...
> c0c00000 T __init_begin
> c0e00000 D _sdata
> c0e68870 D _edata
> c0e68870 B __bss_start
> c0e995d4 B __bss_stop
> c0e995d4 B _end
> 
> So the original covers _text..__init_begin-1 which includes the
> exception and unwind tables. Your version above omits these, which
> leaves them exposed.

Right, this needs to be fixed. Is there any reason the exception and unwind
tables cannot be placed between _sdata and _edata? 

It seems to me that they were left outside for purely historical reasons.
Commit ee951c630c5c ("ARM: 7568/1: Sort exception table at compile time")
moved the exception tables out of .data section before _sdata existed.
Commit 14c4a533e099 ("ARM: 8583/1: mm: fix location of _etext") moved
_etext before the unwind tables and didn't bother to put them into data or
rodata areas.

-- 
Sincerely yours,
Mike.

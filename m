Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0CC39829D
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 09:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhFBHIU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Jun 2021 03:08:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37352 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229753AbhFBHIT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Jun 2021 03:08:19 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15272aoD070108;
        Wed, 2 Jun 2021 03:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=GFBycVBB+/xnfkQ4jX/AScq7z7Un90yyHMcTZFBccbA=;
 b=RzP73lw6Z5V0yFsM5tT3opZIMdNz8zJuEtt+mQTgXJbSNOQ/9Hiked48PLn7QIER9Qs2
 Ed4PU4dHfcSfVvjc9I6nk7RN/EU4DedAPcOuQjS2p67FHJWnkGVy9/JUgUQtpOqaP78f
 lklLYpBCp+GReSSE/bLpzmDmUwvpzRuMj/4NtiMOqYuK11bPrC7SZMWQHwXGnaILS8xH
 oxlHPUBpmCM8FCpToWtTWxtIQrlIaIsdzENMHAfILucP0IZYwH4LIQpiA7M86RdZ6unl
 aeAlL7cuGAI6FX/uDsGCr4I4FX9opLAQIp8johTnzT5WvGsffEZIbaMmVJtl8S+7QHSP Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 38x55h09ks-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 03:06:03 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15273HKp073495;
        Wed, 2 Jun 2021 03:06:03 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0a-001b2d01.pphosted.com with ESMTP id 38x55h09hv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 03:06:02 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15272oDY026082;
        Wed, 2 Jun 2021 07:06:00 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma06fra.de.ibm.com with ESMTP id 38ucvh96a9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 07:06:00 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15275vu933096056
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 2 Jun 2021 07:05:57 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 09E1842042;
        Wed,  2 Jun 2021 07:05:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E5FE84203F;
        Wed,  2 Jun 2021 07:05:53 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.77.40])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed,  2 Jun 2021 07:05:53 +0000 (GMT)
Date:   Wed, 2 Jun 2021 10:05:51 +0300
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
Subject: Re: [RFC/RFT PATCH 0/5] consolidate "System RAM" resources setup
Message-ID: <YLctz5z34knyHVFz@linux.ibm.com>
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210601134429.GY30436@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601134429.GY30436@shell.armlinux.org.uk>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f3G9ixy-BGxGSouhWNCKbcO-usydOj1k
X-Proofpoint-ORIG-GUID: NQ-TJPvOXD2GbphMmpQ8sXZjkW9bcYbI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-02_02:2021-06-01,2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 mlxlogscore=761 bulkscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106020045
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 01, 2021 at 02:44:29PM +0100, Russell King (Oracle) wrote:
> On Mon, May 31, 2021 at 03:29:54PM +0300, Mike Rapoport wrote:
> > * arm has "System RAM (boot alias)" that do not seem useful for any other
> >   architecture
> 
> This is VERY important for kexec and must _not_ be removed, since you
> will be causing a userspace regression by doing so.

I didn't remove these. I'll update the changelog and the cover letter to
make it clear.

-- 
Sincerely yours,
Mike.

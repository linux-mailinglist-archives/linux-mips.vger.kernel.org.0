Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB4F39811F
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 08:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbhFBG1u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Jun 2021 02:27:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48370 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230522AbhFBG1t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Jun 2021 02:27:49 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15263fGb165289;
        Wed, 2 Jun 2021 02:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=8+/9VRNAv6IY+/0kZST7XLNkg1WKMJGSudMsk1U8DnE=;
 b=jKuZ+Ny27BQUwr+RXmXTxyxmQXBhCc0GQn9cnN3mO935659O8T+5M2na/Bn6Yen62lFJ
 Jtf35PGVq6zleF/8WXZ46uv/IINDTIFtenhI00A/Se9aoSbPj7uplrDZHEqvGZokvrqV
 yVjOkrpkjHCKsMmIUClgNqvGdzUiC62R/vjXgE7zePRmx1xBbERqz30LO1Rbs7Y00bU3
 5PW5onWk18LaI26Z42tCvvUKRn4OlWUXUuX4aR+LaFEupSOw6ZuCvw0T4rqB3z0W+Rk3
 kzozFEwuMuBQqUiYpmDoffkZC4Cc3a4oqGz9XccNjV8iWyjBHuXcLcvvgMvoRBpaBmEm lg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 38x3x692v4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 02:25:25 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15265J8I170638;
        Wed, 2 Jun 2021 02:25:24 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 38x3x692um-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 02:25:24 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1526D4Sl009581;
        Wed, 2 Jun 2021 06:25:22 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma05fra.de.ibm.com with ESMTP id 38ud87s5pt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Jun 2021 06:25:22 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 1526OmE333948138
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 2 Jun 2021 06:24:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 945084203F;
        Wed,  2 Jun 2021 06:25:19 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 641E642047;
        Wed,  2 Jun 2021 06:25:16 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.77.40])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed,  2 Jun 2021 06:25:16 +0000 (GMT)
Date:   Wed, 2 Jun 2021 09:25:14 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: Re: [RFC/RFT PATCH 1/5] s390: make crashk_res resource a child of
 "System RAM"
Message-ID: <YLckSuS3UuGbO7+p@linux.ibm.com>
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210531122959.23499-2-rppt@kernel.org>
 <1efc386c-2cb4-164f-7194-497f142f969f@redhat.com>
 <f6cd0c41-d7e2-65f5-94eb-9a21514df799@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6cd0c41-d7e2-65f5-94eb-9a21514df799@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c5HaVm2LHSDSHbt0toyr1MgJ5NoALSH5
X-Proofpoint-GUID: kxH_e3tqR0DMOSN98IBtjQCfDsHcIA-h
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-02_01:2021-06-01,2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106020039
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 01, 2021 at 11:02:17AM +0200, David Hildenbrand wrote:
> On 01.06.21 10:45, David Hildenbrand wrote:
> > On 31.05.21 14:29, Mike Rapoport wrote:
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > 
> > > Commit 4e042af463f8 ("s390/kexec: fix crash on resize of reserved memory")
> > > added a comment that says "crash kernel resource should not be part of the
> > > System RAM resource" but never explained why. As it looks from the code in
> > > the kernel and in kexec there is no actual reason for that.
> > 
> > Are you sure?
> > 
> > Looking at kexec-tools: kexec/arch/s390/kexec-s390.c
> > 
> > get_memory_ranges_s390() wants "System RAM" and Crash kernel only with
> > "with_crashk=1". Your patch would change that. "Crash kernel" would
> > always be included if you make it a child of "System RAM".
> > 
> > Further, get_memory_ranges() and is_crashkernel_mem_reserved() look out
> > for "Crash kernel\n" via parse_iomem_single().
> > 
> > However, parse_iomem_single() does not care about ranges that start with
> > spaces IIRC via
> >     sscanf(line, "%llx-%llx : %n" ...
> 
> I think I'm wrong about that one because I read
> 
> "Input white-space characters (as specified by the isspace function) are
> skipped, unless the specification includes a [ , c , or n specifier"
> 
> So having it as a child won't affect parse_iomem_single().

Yes, this was my understanding as well.

-- 
Sincerely yours,
Mike.

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0B61A323F
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 12:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgDIKHn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 06:07:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3148 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725783AbgDIKHn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 06:07:43 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 039A3dpq080708
        for <linux-mips@vger.kernel.org>; Thu, 9 Apr 2020 06:07:42 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 30921hjbwx-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-mips@vger.kernel.org>; Thu, 09 Apr 2020 06:07:42 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-mips@vger.kernel.org> from <rppt@linux.ibm.com>;
        Thu, 9 Apr 2020 11:07:20 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 9 Apr 2020 11:07:12 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 039A7VBW33358272
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 9 Apr 2020 10:07:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5F75411C05C;
        Thu,  9 Apr 2020 10:07:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A2EEE11C05E;
        Thu,  9 Apr 2020 10:07:28 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.207.228])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu,  9 Apr 2020 10:07:28 +0000 (GMT)
Date:   Thu, 9 Apr 2020 13:07:26 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Robert Richter <rric@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Subject: Re: [PATCH 12/12] MIPS: ip27: Fix includes
References: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
 <20200408130024.2529220-7-jiaxun.yang@flygoat.com>
 <20200409091922.GA17293@linux.ibm.com>
 <20200409173835.27ed1e64@flygoat-x1e>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409173835.27ed1e64@flygoat-x1e>
X-TM-AS-GCONF: 00
x-cbid: 20040910-0008-0000-0000-0000036D7458
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040910-0009-0000-0000-00004A8F160C
Message-Id: <20200409100726.GB17293@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-09_03:2020-04-07,2020-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=1 bulkscore=0 adultscore=0
 mlxlogscore=246 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004090073
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 09, 2020 at 05:38:35PM +0800, Jiaxun Yang wrote:
> On Thu, 9 Apr 2020 12:19:22 +0300
> Mike Rapoport <rppt@linux.ibm.com> wrote:
> 
> > On Wed, Apr 08, 2020 at 08:59:54PM +0800, Jiaxun Yang wrote:
> > > Somehow changes in topology messed up headers.
> > > So just add necessary headers to make it compile again.  
> > 
> > Please avoid aftermath build fixes because it breaks bisection.
> > Each commit should be buildable, so this changes should go into the
> > patches that actually require them.
> 
> I'd love to but for that I'll have to squash patch #5~#12 into a single
> patch. T thought it's to big and touching too many files.
> 
> Is that acceptable? 

If I understand correctly, the patches #5-#12 replace custom MIPS
implementation of CPU topology with a generic one, so making them a single
patch could be Ok as it is single logical change.

But I'm not sure it is required. Judging by diffstat, my guess would be
that patch #5 breaks ip27 builds. If that's true, only patch #5 should be
redacted
 
> Thanks.
> >  
> > > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > > ---
> --
> Jiaxun Yang
> 
> 

-- 
Sincerely yours,
Mike.


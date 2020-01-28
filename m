Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 208D114B3FF
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 13:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgA1MKS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 07:10:18 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60042 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726034AbgA1MKS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jan 2020 07:10:18 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00SC7IKw078857
        for <linux-mips@vger.kernel.org>; Tue, 28 Jan 2020 07:10:16 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2xrg63benf-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-mips@vger.kernel.org>; Tue, 28 Jan 2020 07:10:16 -0500
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-mips@vger.kernel.org> from <rppt@linux.ibm.com>;
        Tue, 28 Jan 2020 12:10:12 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 28 Jan 2020 12:10:02 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 00SCA17u41681050
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Jan 2020 12:10:01 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5A00D11C04A;
        Tue, 28 Jan 2020 12:10:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0B8F411C050;
        Tue, 28 Jan 2020 12:09:58 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.59.112])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 28 Jan 2020 12:09:57 +0000 (GMT)
Date:   Tue, 28 Jan 2020 14:09:56 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Qian Cai <cai@lca.pw>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Linux-MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
 <214c0d53-eb34-9b0c-2e4e-1aa005146331@arm.com>
 <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
X-TM-AS-GCONF: 00
x-cbid: 20012812-0028-0000-0000-000003D5276E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012812-0029-0000-0000-000024996EC2
Message-Id: <20200128120956.GB6363@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-28_03:2020-01-24,2020-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=820
 malwarescore=0 suspectscore=56 phishscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001280098
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Qian,

On Mon, Jan 27, 2020 at 10:33:08PM -0500, Qian Cai wrote:
> 
> > On Jan 27, 2020, at 10:06 PM, Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> >
> > enablement of this test (for the moment) but then the goal is to integrate all
> > of them going forward. The test not only validates platform's adherence to the
> > expected semantics from generic MM but also helps in keeping it that way during
> > code changes in future as well.
> 
> Another option maybe to get some decent arches on board first before merging this
> thing, so it have more changes to catch regressions for developers who might run this. 

Aren't x86 and arm64 not decent enough?
Even if this test could be used to detect regressions only on these two
platforms, the test is valuable.
 

-- 
Sincerely yours,
Mike.


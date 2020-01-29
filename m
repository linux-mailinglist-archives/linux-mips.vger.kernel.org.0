Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9883414D300
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2020 23:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgA2WVC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jan 2020 17:21:02 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10332 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726617AbgA2WVC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Jan 2020 17:21:02 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00TMDsDe122784
        for <linux-mips@vger.kernel.org>; Wed, 29 Jan 2020 17:21:01 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2xuagn9781-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-mips@vger.kernel.org>; Wed, 29 Jan 2020 17:21:00 -0500
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-mips@vger.kernel.org> from <gerald.schaefer@de.ibm.com>;
        Wed, 29 Jan 2020 22:20:57 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 29 Jan 2020 22:20:47 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 00TMJtGT43974988
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 Jan 2020 22:19:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E97D85204E;
        Wed, 29 Jan 2020 22:20:46 +0000 (GMT)
Received: from thinkpad (unknown [9.152.96.253])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BB14952052;
        Wed, 29 Jan 2020 22:20:45 +0000 (GMT)
Date:   Wed, 29 Jan 2020 23:20:44 +0100
From:   Gerald Schaefer <gerald.schaefer@de.ibm.com>
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
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
In-Reply-To: <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
        <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
        <214c0d53-eb34-9b0c-2e4e-1aa005146331@arm.com>
        <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20012922-0016-0000-0000-000002E1DF70
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012922-0017-0000-0000-00003344A733
Message-Id: <20200129232044.2d133d98@thinkpad>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-29_07:2020-01-28,2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=60 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290170
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 27 Jan 2020 22:33:08 -0500
Qian Cai <cai@lca.pw> wrote:

> > 
> >> Did those tests ever find any regression or this is almost only useful for new
> > 
> > The test has already found problems with s390 page table helpers.
> 
> Hmm, that is pretty weak where s390 is not even official supported with this version.
> 

I first had to get the three patches upstream, each fixing non-conform
behavior on s390, and each issue was found by this extremely useful test:

2416cefc504b s390/mm: add mm_pxd_folded() checks to pxd_free()
2d1fc1eb9b54 s390/mm: simplify page table helpers for large entries
1c27a4bc817b s390/mm: make pmd/pud_bad() report large entries as bad

I did not see any direct effect of this misbehavior yet, but I am
very happy that this could be found and fixed in order to prevent
future issues. And this is exactly the value of this test, to make
sure that all architectures have a common understanding of how
the various page table helpers are supposed to work.

For example, who would have thought that pXd_bad() is supposed to
report large entries as bad? It's not really documented anywhere,
so we just checked them for sanity like normal entries, which
apparently worked fine so far, but for how long?


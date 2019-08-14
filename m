Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D10168D4B3
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2019 15:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbfHNN3n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Aug 2019 09:29:43 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:48274 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727954AbfHNN3n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Aug 2019 09:29:43 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7EDSwL8051616;
        Wed, 14 Aug 2019 13:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=/7//kmOrqhhp8O4LuF61rEBvEGdxH5BSo4SewEJRvtk=;
 b=hbL+u1zUilX32JNT/hEaFTr9RvXXPXNMaGGkw3NMO8TZ6rHXRLkYNs8UbLAsIpR35nYe
 XaCL08yq5n/kPC0vlcgop9h58e7hPb4ksO7sIQC1/YlI+DWwyEAX+1CZzq9e4s0GInx/
 O0T0Pr/NtThKc8CmkSqam4HMkD3HmXHgR0NKb45cCwQaI65qCXhvTf0AiKhzD+jO80xa
 Mh21Xo0o73dG0kKnVVBoW3Wa8Z2x8BLK1lMLL2p2SKKbE7x6RuDnnCAtjyzJczKN6eZa
 7U+RQKpcLLpJKzWlqoJTksY4GLwkTX58BxHwTlA/uC5PRLZ824neuIWiZgckCA4Q2erl Rw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2u9pjqmpfj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Aug 2019 13:29:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7EDSU8s040634;
        Wed, 14 Aug 2019 13:29:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2ubwcy151a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Aug 2019 13:29:31 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7EDTURH019559;
        Wed, 14 Aug 2019 13:29:30 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 14 Aug 2019 06:29:30 -0700
Date:   Wed, 14 Aug 2019 16:29:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ralf@linux-mips.org
Cc:     linux-mips@vger.kernel.org
Subject: [bug report] [MIPS] MT: Improved multithreading support.
Message-ID: <20190814132924.GA23964@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9348 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=518
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908140139
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9348 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=572 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908140139
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[ This is ancient code, but the bug is straight forward -- dan ]

Hello Ralf Baechle,

The patch 41c594ab65fc: "[MIPS] MT: Improved multithreading support."
from Apr 5, 2006, leads to the following static checker warning:

	arch/mips/kernel/smp-mt.c:168 vsmp_boot_secondary()
	warn: potential pointer math issue

arch/mips/kernel/smp-mt.c
   142  static int vsmp_boot_secondary(int cpu, struct task_struct *idle)
   143  {
   144          struct thread_info *gp = task_thread_info(idle);
                ^^^^^^^^^^^^^^^^^^^^^^
gp is a thread_info struct pointer.

   145          dvpe();
   146          set_c0_mvpcontrol(MVPCONTROL_VPC);
   147  
   148          settc(cpu);
   149  
   150          /* restart */
   151          write_tc_c0_tcrestart((unsigned long)&smp_bootstrap);
   152  
   153          /* enable the tc this vpe/cpu will be running */
   154          write_tc_c0_tcstatus((read_tc_c0_tcstatus() & ~TCSTATUS_IXMT) | TCSTATUS_A);
   155  
   156          write_tc_c0_tchalt(0);
   157  
   158          /* enable the VPE */
   159          write_vpe_c0_vpeconf0(read_vpe_c0_vpeconf0() | VPECONF0_VPA);
   160  
   161          /* stack pointer */
   162          write_tc_gpr_sp( __KSTK_TOS(idle));
   163  
   164          /* global pointer */
   165          write_tc_gpr_gp((unsigned long)gp);
   166  
   167          flush_icache_range((unsigned long)gp,
   168                             (unsigned long)(gp + sizeof(struct thread_info)));
                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This should almost certainly be "gp + 1" because of pointer math.

   169  
   170          /* finally out of configuration and into chaos */
   171          clear_c0_mvpcontrol(MVPCONTROL_VPC);
   172  
   173          evpe(EVPE_ENABLE);
   174  
   175          return 0;
   176  }

regards,
dan carpenter

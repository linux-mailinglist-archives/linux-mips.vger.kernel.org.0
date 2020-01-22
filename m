Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF46F145206
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 11:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729078AbgAVKEO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 05:04:14 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:46892 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbgAVKEO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jan 2020 05:04:14 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00MA3dNt106729;
        Wed, 22 Jan 2020 10:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=/QA6AfPHVwozNWFEEdXxQ8+/e88nFGzoSR63Xa4pjWg=;
 b=DtbMSR5cLZV56NvujvLrzqJt//P9Ktq32BEszHP0nUELfdmeqUTPXQIFupy6BlVmJ8X4
 AYLxLuB3Mwh40N7o5s0GuOkL7fbTutSTghxPwCg58mG91nj2/TQgI8qrFwVnEXF3wji2
 ZBB6X/jmILH+6qK94o6GYIx01I+1bs/Fq5k+bweJZ+tmCtHeKxk1xM4EpHRRgaR3ZRt3
 wZf0IgCKfrnvdTafgQSUSy/0MlJ8ItCupi0YbMLxHkiXKH8uiaOdDsJ0OW8L42Skkfgv
 Ltj/VbWqGrab5FcURrWU8j+0m9p9P3TEbsCv1pGrqMHIkipRAz3EbT5FoYH7G9XvkYpF Ig== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2xktnrah90-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jan 2020 10:04:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00MA46Ew037588;
        Wed, 22 Jan 2020 10:04:10 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2xnsaaq3r6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jan 2020 10:04:09 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00MA3WsC031159;
        Wed, 22 Jan 2020 10:03:33 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 22 Jan 2020 02:03:31 -0800
Date:   Wed, 22 Jan 2020 13:03:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     tbogendoerfer@suse.de
Cc:     linux-mips@vger.kernel.org
Subject: [bug report] MIPS: add support for SGI Octane (IP30)
Message-ID: <20200122100324.xo67qbzzx6et6cbs@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9507 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=359
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001220092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9507 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=436 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001220092
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Thomas Bogendoerfer,

This is a semi-automatic email about new static checker warnings.

The patch 7505576d1c1a: "MIPS: add support for SGI Octane (IP30)"
from Oct 24, 2019, leads to the following Smatch complaint:

    ./arch/mips/sgi-ip30/ip30-irq.c:236 heart_domain_free()
     warn: variable dereferenced before check 'irqd' (see line 235)

./arch/mips/sgi-ip30/ip30-irq.c
   234		irqd = irq_domain_get_irq_data(domain, virq);
   235		clear_bit(irqd->hwirq, heart_irq_map);
                          ^^^^^^^^^^^
Dereference

   236		if (irqd && irqd->chip_data)
                    ^^^^
Check too late.

   237			kfree(irqd->chip_data);
   238	}

regards,
dan carpenter

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808723DD3C3
	for <lists+linux-mips@lfdr.de>; Mon,  2 Aug 2021 12:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbhHBKfB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Aug 2021 06:35:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26504 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231881AbhHBKfB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Aug 2021 06:35:01 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 172A4NG2173500;
        Mon, 2 Aug 2021 06:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=r00k+UjFn2pP62ZTrfQkfAUimzcY0iIqFp/tRGXpoq0=;
 b=XB+IyIVRuwsaGl5Cf36GJrmEG3pUanAUVbJd0L+oKz2n9pFqA/PMFgwKaU8Fqyy8Lva3
 Kbt8Pm8E3v6Do/WIyQyINblL2EUrwMVz8/MgaVk9CKB/lYzJLp0Z77DY+Z/NLG27Hxbj
 E9qpS5txHaS6nt9qU2jVBdzVhvDQmwEAwKpzUg/IADG8yUZYRc/KRZKQB9m3YaMNAQ/V
 mqocdQdQhDdcY8hBX72GpQ0R0Ltra1dQR25fDeh1xYBUCQnH2894AsakTiIyquwCzLQd
 SFjOXifLtRwVjfMNlR/0nvfzPGZm64KH9KxFjtA2pZJTcvqIwBuMeqWbhKoD7NaDevz8 Aw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3a5ks7xgv8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Aug 2021 06:34:20 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 172AY3xg012514;
        Mon, 2 Aug 2021 10:34:18 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma04fra.de.ibm.com with ESMTP id 3a4x594481-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Aug 2021 10:34:18 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 172AYEbo30605618
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 2 Aug 2021 10:34:14 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 99BA0520E2;
        Mon,  2 Aug 2021 10:34:14 +0000 (GMT)
Received: from sig-9-145-37-103.uk.ibm.com (unknown [9.145.37.103])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id AED60520D5;
        Mon,  2 Aug 2021 10:34:13 +0000 (GMT)
Message-ID: <a5a46d84866f69df8c9737ecd8b066b61f24960a.camel@linux.ibm.com>
Subject: Re: [PATCH v2 13/21] s390/pci: don't set failed sg dma_address to
 DMA_MAPPING_ERROR
From:   Niklas Schnelle <schnelle@linux.ibm.com>
To:     Logan Gunthorpe <logang@deltatee.com>,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
        xen-devel@lists.xenproject.org
Cc:     Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Stephen Bates <sbates@raithlin.com>,
        Martin Oliveira <martin.oliveira@eideticom.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Date:   Mon, 02 Aug 2021 12:34:13 +0200
In-Reply-To: <20210723175008.22410-14-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
         <20210723175008.22410-14-logang@deltatee.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zc7l-lzfyaxYg5Vm8LQLNSA4emMVITXD
X-Proofpoint-GUID: zc7l-lzfyaxYg5Vm8LQLNSA4emMVITXD
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-02_01:2021-08-02,2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020069
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 2021-07-23 at 11:50 -0600, Logan Gunthorpe wrote:
> Setting the ->dma_address to DMA_MAPPING_ERROR is not part of
> the ->map_sg calling convention, so remove it.
> 
> Link: https://lore.kernel.org/linux-mips/20210716063241.GC13345@lst.de/
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  arch/s390/pci/pci_dma.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
> index c78b02012764..be48e5b5bfcf 100644
> --- a/arch/s390/pci/pci_dma.c
> +++ b/arch/s390/pci/pci_dma.c
> @@ -492,7 +492,6 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
>  	for (i = 1; i < nr_elements; i++) {
>  		s = sg_next(s);
>  
> -		s->dma_address = DMA_MAPPING_ERROR;
>  		s->dma_length = 0;
>  
>  		if (s->offset || (size & ~PAGE_MASK) ||

Acked-by: Niklas Schnelle <schnelle@linux.ibm.com>

Thanks!


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F853CB424
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jul 2021 10:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237550AbhGPI1i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Jul 2021 04:27:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29638 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237504AbhGPI1i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Jul 2021 04:27:38 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16G82sot034778;
        Fri, 16 Jul 2021 04:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=8Of+ionZ0K44S7zzH2G1wGenaNNg9cYQDtiQ0dQz6+E=;
 b=BMc79y1KhhQKUFZbOrAhtcEP61wGvhCcKpBh3YItmYniaHy7RinkekOStAMhwPcVbV8g
 tA8KdxQW6CmdQCUDo7HXnXeBDvsxeO1Bxcn4vmR46+BPBqB7+8Ctzlwih1eoet+d/O4e
 U7lnzCYwkCmnuQ2N7TeXEVQB0tNbOBoSC9rb2wWdVRh2ThxQaLFsKo3f4ZcKX5kegGXy
 lsJ/BZHBXKo8Vpdp79tRxovqbQ5nmEvbTtQHpKKZhzPMbI6YKxeWxAqOAKu0r38O+7Ex
 7l5jIUCj1b6+Lwrw1Hy8lrhsFTfLuxB+ksipWyRyg3640fKq4qgCXYb8/oO8DK9d7iju gA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0b-001b2d01.pphosted.com with ESMTP id 39tw3vn83n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 04:24:15 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16G8EkKq007904;
        Fri, 16 Jul 2021 08:24:13 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma02fra.de.ibm.com with ESMTP id 39s3p78tv5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 08:24:13 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16G8OAou20840890
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Jul 2021 08:24:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 167C84C04A;
        Fri, 16 Jul 2021 08:24:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2C04E4C04E;
        Fri, 16 Jul 2021 08:24:09 +0000 (GMT)
Received: from sig-9-145-73-130.uk.ibm.com (unknown [9.145.73.130])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 16 Jul 2021 08:24:09 +0000 (GMT)
Message-ID: <352f2a35d62399fce1dca0ce1158974ecda3904c.camel@linux.ibm.com>
Subject: Re: [PATCH v1 10/16] s390/pci: return error code from
 s390_dma_map_sg()
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
Date:   Fri, 16 Jul 2021 10:24:08 +0200
In-Reply-To: <20210715164544.6827-11-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
         <20210715164544.6827-11-logang@deltatee.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Au675VXZyfEIxm3kG5FUCjrWY9DzzlcG
X-Proofpoint-ORIG-GUID: Au675VXZyfEIxm3kG5FUCjrWY9DzzlcG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_02:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160048
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 2021-07-15 at 10:45 -0600, Logan Gunthorpe wrote:
> From: Martin Oliveira <martin.oliveira@eideticom.com>
> 
> The .map_sg() op now expects an error code instead of zero on failure.
> 
> So propagate the error from __s390_dma_map_sg() up.
> 
> Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  arch/s390/pci/pci_dma.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
> index ebc9a49523aa..c78b02012764 100644
> --- a/arch/s390/pci/pci_dma.c
> +++ b/arch/s390/pci/pci_dma.c
> @@ -487,7 +487,7 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
>  	unsigned int max = dma_get_max_seg_size(dev);
>  	unsigned int size = s->offset + s->length;
>  	unsigned int offset = s->offset;
> -	int count = 0, i;
> +	int count = 0, i, ret;
>  
>  	for (i = 1; i < nr_elements; i++) {
>  		s = sg_next(s);
> @@ -497,8 +497,9 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
>  
>  		if (s->offset || (size & ~PAGE_MASK) ||
>  		    size + s->length > max) {
> -			if (__s390_dma_map_sg(dev, start, size,
> -					      &dma->dma_address, dir))
> +			ret = __s390_dma_map_sg(dev, start, size,
> +						&dma->dma_address, dir);
> +			if (ret)
>  				goto unmap;
>  
>  			dma->dma_address += offset;
> @@ -511,7 +512,8 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
>  		}
>  		size += s->length;
>  	}
> -	if (__s390_dma_map_sg(dev, start, size, &dma->dma_address, dir))
> +	ret = __s390_dma_map_sg(dev, start, size, &dma->dma_address, dir);
> +	if (ret)
>  		goto unmap;
>  
>  	dma->dma_address += offset;
> @@ -523,7 +525,7 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
>  		s390_dma_unmap_pages(dev, sg_dma_address(s), sg_dma_len(s),
>  				     dir, attrs);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void s390_dma_unmap_sg(struct device *dev, struct scatterlist *sg,

So the error codes we return are -ENOMEM if allocating a DMA
translation entry fails and -EINVAL if the DMA translation table hasn't
been initialized or the caller tries to map 0 sized memory. Are these
error codes that you would expect? If yes then this change looks good
to me.

Acked-by: Niklas Schnelle <schnelle@linux.ibm.com>


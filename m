Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDAA5FD5B8
	for <lists+linux-mips@lfdr.de>; Thu, 13 Oct 2022 09:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbiJMHsg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Oct 2022 03:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiJMHsf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Oct 2022 03:48:35 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC69A122BE0
        for <linux-mips@vger.kernel.org>; Thu, 13 Oct 2022 00:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665647314; x=1697183314;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TW6SOpQjxf8WZxrXeW9B+zZiJfs42MWqJ6VpceHM6xc=;
  b=DHQmPzhRo64XcXSYVr2BvTM98ia7a+KFFtAWwSPc+ZRYGcHM4sAJvLvM
   3wOp40ztQnECn15BMXTJSJcXGCgbifnP/PaFiivUThHCby3QPG3D+2gVx
   W05h8HxoU1KZ9PDDu5632gUlflyAbBxFSvPtjEujprzvJ9JqDebHlDnMA
   5OCR8YxZi2G3kvh3YZRAukxtu66ZzmC5IZlth85e1h1ZIPVOdLvfpluAt
   w+1wOL9R8jHdQ+9gUUOBaW+czcKqAWBUKJZi+OtUt29YT8hJ5XUPeTMvC
   aNRt+DcHyxnSuArPZYxurdVUdWi0erNsJXaJgz1yb1LjmB9nNcUq0XIke
   w==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661788800"; 
   d="scan'208";a="218866585"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 13 Oct 2022 15:48:33 +0800
IronPort-SDR: gseIQMMwwLVLT7OC/1oxGXiGcAJ3UJsCTyMVRq90iUfJO7WgWoX1IXjYVXs6ag/x62d2UrnLjc
 UVMqDgQnHfXYsKXwitBfZES55GUNdckc0z5VJm0bjbbGDXI88fPaRzu6lIAETX0lZs0Nzw3ReG
 NfQopDUXFDO/k1XVDY/rTBbfYam2/BmigB83L1Vo5yP4Cn2LXJO+/KjRGIL57StV6lyt8bn/Z2
 YD4VM/xte8I9UTeLYt16ySOpH+Pm+7RARJlL1JzbPZbmbdq4TLFZ4LpshuY7Sih/+15ftezibM
 NSWyH7NtsiVjG/AhSftQpcaa
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2022 00:08:11 -0700
IronPort-SDR: ul4NjbZc+Yvbcq/qs75R8C5TI+SPAsOF1zSIzqkf+ms4zmOJTckXurTK/zZ6pwnCNfZ0KOcFMM
 ubCRlZtVDxXywBP5UnRlhic0prSxVuCEsJ4awkVX71A1Ag3B8cYJ380G6TCgCf7ihBewy7wJAq
 gjPl6lyPBJadK9TbJouzGz8BToeqwWIo7yLoiqK2nWiIauj5SnMMgG/YQgUj8nm683mOcwlXOk
 l3XANxCdF4JR8Ml40e3Du/5nqSzs1LB8BYApQQhd+oyEFB8mAiJwSPMkOVkds6x/ixlNU3CEzr
 Ne8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2022 00:48:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mp1q531C7z1Rwrq
        for <linux-mips@vger.kernel.org>; Thu, 13 Oct 2022 00:48:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1665647312; x=1668239313; bh=TW6SOpQjxf8WZxrXeW9B+zZiJfs42MWqJ6V
        pceHM6xc=; b=O1XznsEJI5uxiWZLiyx9twftJFXWvzo8MQP88H6XIKXwRe47gDd
        4+BWjL7JXL60mkkxmQuIOrwDNdq5+5BVJrMCMPWizFh1RPvq276+WG3eyR0Hwv8X
        1APOUdPtqqyLdHNdzNfh55XmST0Sm+flYBFvVyeJqDlUEBJTv5g+CCZ1emDgd9m2
        cuULYJJXQ6XHan4cusFKyq1kEnxLoF4VNaGBcgvi4hwyZcPo7V2vum0F7VOvfJhq
        t9C7V8XdpbLDNaV/rEIKluZBCsxDk0ty5wlzzyzF0vL1OExxo00cd+dtdCRrO7TU
        5PYKFBoWQ9ivxcsAXKwtftD6ceuDxxCRNsA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 2X5VRtg3oCdD for <linux-mips@vger.kernel.org>;
        Thu, 13 Oct 2022 00:48:32 -0700 (PDT)
Received: from [10.89.85.169] (c02drav6md6t.dhcp.fujisawa.hgst.com [10.89.85.169])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mp1q36JJGz1RvLy;
        Thu, 13 Oct 2022 00:48:31 -0700 (PDT)
Message-ID: <8f9304d0-5f28-7378-626b-d734fa7a39a0@opensource.wdc.com>
Date:   Thu, 13 Oct 2022 16:48:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: drivers/ata/ahci_st.c:229:34: warning: unused variable
 'st_ahci_match'
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org
References: <202210121422.MJsXaw1M-lkp@intel.com>
 <4517c95f-1dad-5a8c-5202-073d0a7eff29@opensource.wdc.com>
 <4429d1ec-579e-4b0d-a8d8-06b9a5877a9c@app.fastmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <4429d1ec-579e-4b0d-a8d8-06b9a5877a9c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2022/10/13 16:33, Arnd Bergmann wrote:
> On Thu, Oct 13, 2022, at 8:13 AM, Damien Le Moal wrote:
>> On 10/12/22 15:37, kernel test robot wrote:
> 
>> I am at a loss with this one... There are plenty of patterns similar to
>> drivers/ata/ahci_st.c doing something like:
>>
>> static const struct of_device_id st_ahci_match[] = {
>>
>>         { .compatible = "st,ahci", },
>>
>>         { /* sentinel */ }
>>
>> };
>>
>> MODULE_DEVICE_TABLE(of, st_ahci_match);
>>
>> For instance, in drivers/pwm/pwm-sti.c, we have:
>>
>>
>> And countless others like this for STI and other arch too.
>>
>> So if CONFIG_MODULE is not enabled, how come we are not submerged with
>> warnings about unused variables ? Is mips arch special in this regard ?
>> Or am I missing something ?
> 
> It has nothing to do with MIPS, the problem is
> 
>                 .of_match_table = of_match_ptr(st_ahci_match),
> 
> The 'of_match_ptr()' sets the pointer to NULL when CONFIG_OF is
> disabled, which avoids a build failure when st_ahci_match[]
> itself is in an #ifdef.
> 
> In this driver, there is no #ifdef around st_ahci_match[], so we
> simply want
> 
>                 .of_match_table = st_ahci_match,
> 
> The thing with the MODULE_DEVICE_TABLE() is that it would
> create another reference if CONFIG_MODULE is enabled, but not
> for a built-in driver, so you only get this type of warning
> for randconfig builds that have the driver built-in and OF
> disabled.
> 
> It's a common mistake, and we should probably remove most
> of the of_match_ptr() references as you rarely have drivers
> that optionally use OF support but benefit from compiling
> that support out on kernels without OF.

Got it. Thanks for the info !

Will patch this and check other ata drivers for the same issue.


-- 
Damien Le Moal
Western Digital Research


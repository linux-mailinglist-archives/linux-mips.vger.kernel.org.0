Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4401652493C
	for <lists+linux-mips@lfdr.de>; Thu, 12 May 2022 11:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352173AbiELJjI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 May 2022 05:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352150AbiELJjG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 May 2022 05:39:06 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7D8BA983
        for <linux-mips@vger.kernel.org>; Thu, 12 May 2022 02:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652348344; x=1683884344;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=1nlewdg0XWeqjilpCKRbnD9w/C8oTpISFMzJIZnZoIs=;
  b=i+NBVrVc/r7ZAgrIEFZZnpYKpDf/01qCRV+THuOBavsTTlNIgvdyhRn8
   YYUBPqOXLBd40zcsNmCKiIr/ynrZQHCA4eKaYwfDqpJBmemWv0JFSiU11
   +b7PXUofDCe6YgmxNGp7CHG9UFZHzVYZn7fj+ZwxGC13HNMKiISwxHRa3
   jtHSU7/gnVrSU0UwV0u3zllTvcB8UNnsL54e/U+EJu2YQdgHNtRLUVpXg
   rNAzsUIEKG8WAjYI8C9GIw16ewvh9kvqGdN5W6mn3TYO5o+pNbgxN+kHD
   MEW0OpkUfVpIwldr1JCHbE3mbwvp9I2MJ8NCQm4whsSFh7JbIEuEeKf+j
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="295198985"
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; 
   d="scan'208";a="295198985"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 02:38:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; 
   d="scan'208";a="566602206"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.30.14]) ([10.255.30.14])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 02:38:45 -0700
Subject: Re: [kbuild-all] Re: [linux-next:master 1238/7959] mips64el-linux-ld:
 warning: orphan section `.ctors.65436' from `kernel/module/main.o' being
 placed in section `.ctors.65436'
To:     Luis Chamberlain <mcgrof@kernel.org>,
        kernel test robot <lkp@intel.com>, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org
Cc:     Aaron Tomlin <atomlin@redhat.com>, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
References: <202205022005.yeXAj5Zz-lkp@intel.com>
 <YnmW+il1s2TKKh13@bombadil.infradead.org>
From:   "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <d0ddb9b3-cd0d-b131-17ef-220227d160ff@intel.com>
Date:   Thu, 12 May 2022 17:38:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YnmW+il1s2TKKh13@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-10.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 5/10/2022 6:34 AM, Luis Chamberlain wrote:
> On Mon, May 02, 2022 at 08:06:59PM +0800, kernel test robot wrote:
>> All warnings (new ones prefixed by >>):
>>
>>     mips64el-linux-ld: warning: orphan section `.ctors.65436' from `arch/mips/kernel/signal_o32.o' being placed in section `.ctors.65436'
> <-- tons of these -->
> <-- snip -->
> 
>>>> mips64el-linux-ld: warning: orphan section `.ctors.65436' from `kernel/module/main.o' being placed in section `.ctors.65436'
> 
> This is not due to the changes, this is just that the linker for
> mips64el-linux-ld loves to complain about these for any new kernel
> object.
> 
> So nothing will be done or can be done as far as modules-next is
> concerned.
> 
>    Luis

Hi Luis,

Sorry for the inconvenience, we have ignored such warning recently.

Best Regards,
Rong Chen

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F18BF2A3C0C
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 06:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgKCFkh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 00:40:37 -0500
Received: from relay5.mymailcheap.com ([159.100.241.64]:46957 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgKCFkh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Nov 2020 00:40:37 -0500
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.113.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 170E22008F;
        Tue,  3 Nov 2020 05:40:34 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 98DBA3EDEC;
        Tue,  3 Nov 2020 06:40:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 7B68E2A7E2;
        Tue,  3 Nov 2020 06:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1604382032;
        bh=SmYDJ/wiXl+xPUKtnENmqp9QdxoljrKsi1wq7af26m8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=B7vq+z+BRYnV+a9tpTFaWH6r5hgAC5JK0bK333gLWb2F/4EbVNhATHZSCgvxXnyDP
         /TpUztB7KdYriK3YUyonorU7yevdxqtCHpc9qKENtP+/GquyWRzuzIuqIiAUY/flpY
         v54HkWVBZqciXkoU25rkZKO7S3aM+N9DJx7GoVVE=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ofCepkObmbwk; Tue,  3 Nov 2020 06:40:30 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Tue,  3 Nov 2020 06:40:30 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 9C4A34012A;
        Tue,  3 Nov 2020 05:40:29 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="StIpVnQm";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [113.52.132.214])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 85FCF4012A;
        Tue,  3 Nov 2020 05:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1604382023;
        bh=SmYDJ/wiXl+xPUKtnENmqp9QdxoljrKsi1wq7af26m8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=StIpVnQmYuH1lQ2Jh6SlJyoq50KJwOAKvreLZBTHw3IpX/M38YTUo3ykJglOlJEdQ
         Aii7tJlkpcIT8DnSnXD5dzRq4NdTEJCETUG8BN0WENgAaLZ/ZvVg7gIoispcKMXfMm
         pjxvQDhbuuGho+1WN28PwugBfQCwHtpQfA5qgvaU=
Subject: Re: [PATCH RESEND 1/2] MIPS: cacheinfo: Add missing VCache
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20200820004253.3418-1-jiaxun.yang@flygoat.com>
 <20200820004253.3418-2-jiaxun.yang@flygoat.com>
 <20200821165539.GA15948@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <79476b22-04ef-968b-584a-10aa4357ee6b@flygoat.com>
Date:   Tue, 3 Nov 2020 13:40:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20200821165539.GA15948@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9C4A34012A
X-Spamd-Result: default: False [2.90 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[113.52.132.214:received];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[6];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/8/22 0:55, Thomas Bogendoerfer 写道:
> On Thu, Aug 20, 2020 at 08:42:49AM +0800, Jiaxun Yang wrote:
>> Victim Cache is defined by Loongson as per-core unified
>> private Cache.
>> Add this into cacheinfo and make cache levels selfincrement
>> instead of hardcode levels.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   arch/mips/kernel/cacheinfo.c | 34 ++++++++++++++++++++++++++--------
>>   1 file changed, 26 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/mips/kernel/cacheinfo.c b/arch/mips/kernel/cacheinfo.c
>> index 47312c529410..83548331ee94 100644
>> --- a/arch/mips/kernel/cacheinfo.c
>> +++ b/arch/mips/kernel/cacheinfo.c
>> @@ -35,6 +35,11 @@ static int __init_cache_level(unsigned int cpu)
>>   
>>   	leaves += (c->icache.waysize) ? 2 : 1;
>>   
>> +	if (c->vcache.waysize) {
>> +		levels++;
>> +		leaves++;
>> +	}
>> +
>>   	if (c->scache.waysize) {
>>   		levels++;
>>   		leaves++;
>> @@ -74,25 +79,38 @@ static int __populate_cache_leaves(unsigned int cpu)
>>   	struct cpuinfo_mips *c = &current_cpu_data;
>>   	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>>   	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
>> +	int level = 1;
>>   
>>   	if (c->icache.waysize) {
>> -		/* L1 caches are per core */
>> +		/* D/I caches are per core */
>>   		fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
>> -		populate_cache(dcache, this_leaf, 1, CACHE_TYPE_DATA);
>> +		populate_cache(dcache, this_leaf, level, CACHE_TYPE_DATA);
>>   		fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
>> -		populate_cache(icache, this_leaf, 1, CACHE_TYPE_INST);
>> +		populate_cache(icache, this_leaf, level, CACHE_TYPE_INST);
>> +		level++;
>>   	} else {
>> -		populate_cache(dcache, this_leaf, 1, CACHE_TYPE_UNIFIED);
>> +		populate_cache(dcache, this_leaf, level, CACHE_TYPE_UNIFIED);
>> +		level++;
>> +	}
>> +
>> +	if (c->vcache.waysize) {
> why can't we insert vcache as level 4 and leave the rest of the file
> alone ?

Hi Thomas,

Oops I forgot this patch.

Because  VCache is physicaly placed between Scache and I/D Cache as per
core chahe, it will confuse userspace program otherwise.

Also I do think the level should be continues.

Thanks

- Jiaxun

>
> Thomas.
>

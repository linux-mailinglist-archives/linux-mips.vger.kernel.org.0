Return-Path: <linux-mips+bounces-479-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE0803147
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 426231C20992
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F696224D6;
	Mon,  4 Dec 2023 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Avl3ztQ8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C44CF2;
	Mon,  4 Dec 2023 03:11:52 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B46Mno0020040;
	Mon, 4 Dec 2023 11:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=e+ho6pr3AQa/V47Hgoe+tRla8f7dmqrQ7ZH/7sAQc2s=;
 b=Avl3ztQ8UI4sHvHFI3a8kOjnwbmsn1yPFbf5ErcptHImeHSjtlUdyq6j7OsNXHq4v8qm
 c8Bf/qwaYUaUy1xr5xmF2dQxtsq9EwPfaFHqQT1oqbGQYgaZ7ohdqZ9QaoDrRKyBDxjq
 L27izBCcyTDL7fCW/e4Ku0EXgkBoZ9YhNPkIqzOYgNXOP9FvjjGMeASBH4XBbKYG7NQz
 rpJv4E4LGmobkc1VoJKhHn47cuvufG60fi6awe2GucUI52CT3ki8HsvU3YhNkVbLaWaL
 JptkPs6+5gJJfdkQAZSE8dvDpKFyJ+GiWYQ1US6TxpvvDx34YIahXMwmf4mC+8iZUWVe Kg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3us81ygtwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 11:11:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4BBUZk002169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 11:11:30 GMT
Received: from [10.214.229.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 03:11:24 -0800
Message-ID: <6c52882c-c189-4a67-b8c0-0963ba856659@quicinc.com>
Date: Mon, 4 Dec 2023 16:41:19 +0530
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] CMDLINE: add generic builtin command line
Content-Language: en-US
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring
	<robh@kernel.org>,
        Daniel Gimpelevich
	<daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Tomas Mudrunka <tomas.mudrunka@gmail.com>,
        Sean Anderson
	<sean.anderson@seco.com>, <x86@kernel.org>,
        <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
CC: <xe-linux-external@cisco.com>, Ruslan Bilovol <rbilovol@cisco.com>,
        <linux-kernel@vger.kernel.org>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-2-danielwa@cisco.com>
From: Jaskaran Singh <quic_jasksing@quicinc.com>
In-Reply-To: <20231110013817.2378507-2-danielwa@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q6cxTo-435Y9FN1c34c0ojxeDLpAcLU4
X-Proofpoint-GUID: q6cxTo-435Y9FN1c34c0ojxeDLpAcLU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_06,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040085



On 11/10/2023 7:08 AM, Daniel Walker wrote:
> diff --git a/lib/generic_cmdline.S b/lib/generic_cmdline.S
> new file mode 100644
> index 000000000000..223763f9eeb6
> --- /dev/null
> +++ b/lib/generic_cmdline.S
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <linux/export.h>
> +#include <linux/init.h>
> +
> +#include <asm/setup.h>
> +
> +        __INITDATA
> +
> +       .align 8
> +       .global cmdline_prepend
> +cmdline_prepend:
> +       .ifnc CONFIG_CMDLINE_PREPEND,""
> +       .ascii CONFIG_CMDLINE_PREPEND
> +       .string " "
> +       .else
> +       .byte 0x0
> +       .endif
> +#ifdef CONFIG_CMDLINE_EXTRA
> +       .space COMMAND_LINE_SIZE - (.-cmdline_prepend)
> +       .size cmdline_prepend, COMMAND_LINE_SIZE
> +#endif /* CONFIG_CMDLINE_EXTRA */
> +
> +cmdline_prepend_end:
> +       .size cmdline_prepend, (cmdline_prepend_end - cmdline_prepend)
> +
> +       .align 8
> +       .global cmdline_tmp
> +cmdline_tmp:
> +       .ifnc CONFIG_CMDLINE_PREPEND,""
> +       .size cmdline_tmp, COMMAND_LINE_SIZE
> +       .space COMMAND_LINE_SIZE
> +       .else
> +       .byte 0x0
> +       .endif
> +cmdline_tmp_end:
> +       .size cmdline_tmp, (cmdline_tmp_end - cmdline_tmp)
> +
> +       .align 8
> +       .global cmdline_append
> +       .size cmdline_append, COMMAND_LINE_SIZE
> +cmdline_append:
> +       .ifnc CONFIG_CMDLINE_APPEND,""
> +       .ascii " "
> +       .string CONFIG_CMDLINE_APPEND
> +       .else
> +       .byte 0x0
> +       .endif
> +#ifdef CONFIG_CMDLINE_EXTRA
> +       .space COMMAND_LINE_SIZE - (.-cmdline_append)
> +#endif /* CONFIG_CMDLINE_EXTRA */
> +cmdline_append_end:
> +       .size cmdline_append, (cmdline_append_end - cmdline_append)
> +

Hi Daniel,

I picked these patches to test a usecase of ours. generic_cmdline.S does
not escape semicolons in the CMDLINE_APPEND and CMDLINE_PREPEND strings.
Take this config snippet for example:

CONFIG_CMDLINE_APPEND="slub_debug=FZP,zs_handle,zspage;FZPU page_owner=on"
CONFIG_CMDLINE_BOOL=y
# CONFIG_CMDLINE_EXTRA is not set
# CONFIG_CMDLINE_OVERRIDE is not set
# CONFIG_CMDLINE_PREPEND is not set
# CONFIG_TEST_CMDLINE is not set

While compiling, the word FZPU is considered as a mnemonic because of
the semicolon preceding it causing parsing to fail:

kernel/lib/generic_cmdline.S: Assembler messages:
kernel/lib/generic_cmdline.S:42: Warning: missing closing `"'
kernel/lib/generic_cmdline.S:42: Error: unknown mnemonic `fzpu' -- `fzpu
page_owner=on",""'

Maybe Christophe's suggestion of moving this code to a C file and using
inline assembly helps mitigate similar problems?

Thanks,
Jaskaran.


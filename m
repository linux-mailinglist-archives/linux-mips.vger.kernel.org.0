Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2B41E1F9B
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 12:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731881AbgEZK1B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 06:27:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31442 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731815AbgEZK1A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 06:27:00 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04QA5xxx057571;
        Tue, 26 May 2020 06:25:20 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 316wyrpry4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 May 2020 06:25:20 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04QALbLM089259;
        Tue, 26 May 2020 06:25:20 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0b-001b2d01.pphosted.com with ESMTP id 316wyrprxg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 May 2020 06:25:19 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04QALwVn011238;
        Tue, 26 May 2020 10:25:18 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma04fra.de.ibm.com with ESMTP id 316uf8a9qn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 May 2020 10:25:17 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 04QAPFY2000510
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 May 2020 10:25:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9FB46A404D;
        Tue, 26 May 2020 10:25:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C2F65A4051;
        Tue, 26 May 2020 10:25:11 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
        Tue, 26 May 2020 10:25:11 +0000 (GMT)
Date:   Tue, 26 May 2020 15:55:11 +0530
From:   Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To:     john mathew <john.mathew@unikie.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com, willy@infradead.org,
        valentin.schneider@arm.com, rdunlap@infradead.org,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Subject: Re: [RFC PATCH v5 3/3] docs: scheduler: Add introduction to
 scheduler context-switch
Message-ID: <20200526102511.GA5681@linux.vnet.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20200514092637.15684-1-John.Mathew@unikie.com>
 <20200514092637.15684-4-John.Mathew@unikie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200514092637.15684-4-John.Mathew@unikie.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-05-26_01:2020-05-26,2020-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 bulkscore=0 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005260073
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* john mathew <john.mathew@unikie.com> [2020-05-14 12:26:37]:

> +
> +Context Switching
> +-----------------
> +
> +Context switching, the switching from a running task to another,
> +is done by the context_switch() function defined in kernel/sched.c.

context_switch is defined in kernel/sched/core.c 

> +It is called by __schedule() when a new process has been selected to run.
> +The execution flow is as follows:
> +
> +
> +  For a kernel task switching to a user task, switch_mm_irqs_off()
> +  replaces the address space of prev kernel task with the next from the user
> +  task. Same as for exiting process in this case, the context_switch()

Did you mean existing instead of exiting?

> +  function saves the pointer to the memory descriptor used by prev in the
> +  runqueue???s prev_mm field and resets prev task active address space.
> +
-- 
Thanks and Regards
Srikar Dronamraju

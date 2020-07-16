Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7B9222C79
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 22:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729136AbgGPUIK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 16:08:10 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:61504 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729048AbgGPUIJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 16:08:09 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
        by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 06GK4KWq011494;
        Thu, 16 Jul 2020 13:07:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=facebook;
 bh=PsQpfjdzw2SGHCd6vQlDhoe463s70nayxfAAuHvf+Ao=;
 b=Wlf+51WMr9MP+G7xMNKj6ZXDoeGMg2b5YZPd9gQuywlPQp91mhzSCaiwdL751V7zkx9g
 CtB1q70hKu4upPRlOM0/JWlasbpNf8G/B+ghhLOhQFWjdOJ+GgWpfiJvLOqXsff4Vwe9
 LA1Fyl2Q1wrOYEyVDhvP5oNXy4vtyKVQeJQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by m0089730.ppops.net with ESMTP id 32afftc1p8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jul 2020 13:07:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 16 Jul 2020 13:07:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5HOHoow0qHNamfoXW77aZckErVA752wkjrMRdncPV0nD2ujxqGxbQIQPPysrXaZ7i+6FHCFHyGDcngTThSWSNRDo3tFHdUH4arxgTTyA/rsdYfPVtvLTUpUWG8HypSqMeTe5GXGIS4U353iXXa4F/m4PWh3z2PlHcxFfPbJ49FUE6wGPCr3bXvKDI+D7mVNUtnuHtpNrQSW6Z0HQLNT0IIOBnWIp5ukveXHE/p4n9lOiAbVGekIU/rp7GYRS9NhlWPzNzSwcDNG8jA3OcsXBQtmetxOvXmnkOxz3LOquhK3v9tWhpgdc6g4fxe29hyZb9QDGn2ZHL8nxJUaHGGuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsQpfjdzw2SGHCd6vQlDhoe463s70nayxfAAuHvf+Ao=;
 b=Xshd0PMrZubbKgajzO/AJAe7pgcgd/ML0K905ToZyIi3rF+vLwtxk6dCvr1TKdejyLPBaNQk/go3+pu7U6JpEFLJpjKY83DBPTVvW4F/4Fx612ZGMsemwdr0Cmsi60QF8yZNvP2+JiQQT34ms0oVb89P6w4W/xCw04+S8Y4mSh50vONGXv6PuyvqZnAacCXtBWMU4fzuEDTO4EoIpcm/Xo0GKyBpzHnrvLffB8vrPqopmv8W3eJrDLUkL3Bixae2SmfxdBNIGBSHUL7ikNrasaGPCqeePJ3RIiAFl89tmv2fHK3fRhMW9X3dRe3EpetVfygdClBxY60ql+YMKsGOfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsQpfjdzw2SGHCd6vQlDhoe463s70nayxfAAuHvf+Ao=;
 b=XNRakUIU95nL+sfpx7O0jl3oSgTIeFxeoa++S+SEB/P3cZvjjv6uRuSAAi59hCD/dZyR44A9Ny0NZAmKONHqDhZyN5lDLRudZx5WGjnSbkHCDaRUGrFLbdN7laa3urZ1I3al/Bx1s9bCYsaABn6eCaj8CSL+PHznTwUzdTHXv3g=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fb.com;
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by BYAPR15MB3029.namprd15.prod.outlook.com (2603:10b6:a03:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 16 Jul
 2020 20:07:47 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::48e3:c159:703d:a2f1]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::48e3:c159:703d:a2f1%5]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 20:07:47 +0000
Date:   Thu, 16 Jul 2020 13:07:44 -0700
From:   Roman Gushchin <guro@fb.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
CC:     <linux-mips@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Lameter <cl@linux.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        linux-mm <linux-mm@kvack.org>, Vlastimil Babka <vbabka@suse.cz>,
        Kernel Team <kernel-team@fb.com>,
        open list <linux-kernel@vger.kernel.org>,
        <lkft-triage@lists.linaro.org>
Subject: Re: [PATCH v7 08/19] mm: memcg/slab: save obj_cgroup for non-root
 slab objects
Message-ID: <20200716200744.GB13387@carbon.dhcp.thefacebook.com>
References: <20200623174037.3951353-1-guro@fb.com>
 <20200623174037.3951353-9-guro@fb.com>
 <CA+G9fYs0vDPAL_84oDEVdGdbFEDjAR1RFoVeFTpjN6b2yS+ZPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+G9fYs0vDPAL_84oDEVdGdbFEDjAR1RFoVeFTpjN6b2yS+ZPg@mail.gmail.com>
X-ClientProxiedBy: BY5PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:180::42) To BYAPR15MB4136.namprd15.prod.outlook.com
 (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from carbon.dhcp.thefacebook.com (2620:10d:c090:400::5:2192) by BY5PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:180::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.10 via Frontend Transport; Thu, 16 Jul 2020 20:07:46 +0000
X-Originating-IP: [2620:10d:c090:400::5:2192]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e780fe8-7f57-423c-181b-08d829c3e8d7
X-MS-TrafficTypeDiagnostic: BYAPR15MB3029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR15MB302905B01EB305E0B1DFD774BE7F0@BYAPR15MB3029.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q58COlvtTBLffG9zQe6hO/W3hzrY2CIS5+KR7r0aCqGW7kCgWVoZUw+VwYPj5v77hILspWqLKxfBtIRxcigMs69Rm2IXe3EWwtFcaF5zC8uQImYh2Vnd+eCzy18J0oCNpACnBwc8ox9B4IbUtXvTjppuTgJBQO3+4vQwiqUljkoKJsnOtZkjLu1kFSoWmnsUSP4aqAR57gsPR4FoDQFRqY/3od/P+M2rPtJJ8uDUElMvElY928IGAS7M7ZexGSPO+Jw0sLDUp/BVHdivTRoPEiwX1jrNt3hI7lIUlKdvwj3WyKHZ2k1sOYdUnDqkM4GdBfXeyGzEwU9RY8IF7dqNQp3hmdL6dNmErnMAq8wlwuh30Rx439yGKTCQPi0WZCOyZhyekzDOcD6/OnCUlbSo2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR15MB4136.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(39860400002)(376002)(396003)(136003)(478600001)(52116002)(7696005)(33656002)(316002)(54906003)(83380400001)(30864003)(55016002)(9686003)(4326008)(186003)(66476007)(66946007)(6916009)(86362001)(1076003)(5660300002)(66556008)(2906002)(8676002)(8936002)(6506007)(7416002)(966005)(16526019);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: NvPKzKNEz8vD+eOWOefm2E1U/ulvWByIil5RVZu4OW9rrH0YYL1P55FqqliWkJazGEdem9T+ag0qBdRZmDHPxcnrIGyacS8em+U9al9b7tvRzk3PTfpoAWixHxGS2Zej1EOQIlIHy5YyAePFtGKB8YFa31r1KDoCs7FRKQutcbWSdclgRd0LO6war0HHCxG1bapMoQmAQTrF/JablsxBvfcP+XA3scgxUhXZ1zCkOj3fCR0eZMHcdpfW95ELtcrCKlPU/iqQBTA201yJ9YPoQluEVuHqwIwmQXx0a3H/0UQ9zSIMc8Q08n/fwIuzwnEOCf5iaRXnQLbPU0xe3rGif1c7RWELEjueRf/sKiXamlXWWa5nw6roUAPUL6OxFuzvfKqTnCOmceiXrMq6f9DOh6U/ajBM4E69W9fniXQv8FC157g02kmox3PQWpYgRhQyBeL5uq3L2fjsEWv98TEpCuGyyBOIMK6khVbBvqzRp4dl3rOd3JFXy5ZUsFP9u7nVFGYd9bxdMwm/E64gDVUtrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e780fe8-7f57-423c-181b-08d829c3e8d7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB4136.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 20:07:47.7015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPqby5ZZ152huacOpkJpgM69zuMxj1W6JXhMOogPI9dFDpAUIUeNJxnQYRIAQUNq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3029
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-16_08:2020-07-16,2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 impostorscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007160138
X-FB-Internal: deliver
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 16, 2020 at 10:25:01PM +0530, Naresh Kamboju wrote:
> On Tue, 23 Jun 2020 at 23:11, Roman Gushchin <guro@fb.com> wrote:
> >
> > Store the obj_cgroup pointer in the corresponding place of
> > page->obj_cgroups for each allocated non-root slab object.  Make sure that
> > each allocated object holds a reference to obj_cgroup.
> >
> > Objcg pointer is obtained from the memcg->objcg dereferencing in
> > memcg_kmem_get_cache() and passed from pre_alloc_hook to post_alloc_hook.
> > Then in case of successful allocation(s) it's getting stored in the
> > page->obj_cgroups vector.
> >
> > The objcg obtaining part look a bit bulky now, but it will be simplified
> > by next commits in the series.
> >
> > Signed-off-by: Roman Gushchin <guro@fb.com>
> > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> > Reviewed-by: Shakeel Butt <shakeelb@google.com>
> > ---
> >  include/linux/memcontrol.h |  3 +-
> >  mm/memcontrol.c            | 14 +++++++--
> >  mm/slab.c                  | 18 +++++++-----
> >  mm/slab.h                  | 60 ++++++++++++++++++++++++++++++++++----
> >  mm/slub.c                  | 14 +++++----
> >  5 files changed, 88 insertions(+), 21 deletions(-)
> >
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index f2f9d5d6b7d1..b845e908e76e 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -1404,7 +1404,8 @@ static inline void memcg_set_shrinker_bit(struct mem_cgroup *memcg,
> >  }
> >  #endif
> >
> > -struct kmem_cache *memcg_kmem_get_cache(struct kmem_cache *cachep);
> > +struct kmem_cache *memcg_kmem_get_cache(struct kmem_cache *cachep,
> > +                                       struct obj_cgroup **objcgp);
> >  void memcg_kmem_put_cache(struct kmem_cache *cachep);
> >
> >  #ifdef CONFIG_MEMCG_KMEM
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 60e3f3ca75ca..5e55c7afc18c 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -2973,7 +2973,8 @@ static inline bool memcg_kmem_bypass(void)
> >   * done with it, memcg_kmem_put_cache() must be called to release the
> >   * reference.
> >   */
> > -struct kmem_cache *memcg_kmem_get_cache(struct kmem_cache *cachep)
> > +struct kmem_cache *memcg_kmem_get_cache(struct kmem_cache *cachep,
> > +                                       struct obj_cgroup **objcgp)
> >  {
> >         struct mem_cgroup *memcg;
> >         struct kmem_cache *memcg_cachep;
> > @@ -3029,8 +3030,17 @@ struct kmem_cache *memcg_kmem_get_cache(struct kmem_cache *cachep)
> >          */
> >         if (unlikely(!memcg_cachep))
> >                 memcg_schedule_kmem_cache_create(memcg, cachep);
> > -       else if (percpu_ref_tryget(&memcg_cachep->memcg_params.refcnt))
> > +       else if (percpu_ref_tryget(&memcg_cachep->memcg_params.refcnt)) {
> > +               struct obj_cgroup *objcg = rcu_dereference(memcg->objcg);
> > +
> > +               if (!objcg || !obj_cgroup_tryget(objcg)) {
> > +                       percpu_ref_put(&memcg_cachep->memcg_params.refcnt);
> > +                       goto out_unlock;
> > +               }
> > +
> > +               *objcgp = objcg;
> >                 cachep = memcg_cachep;
> > +       }
> >  out_unlock:
> >         rcu_read_unlock();
> >         return cachep;
> > diff --git a/mm/slab.c b/mm/slab.c
> > index 4c7013eeacd9..a7cc1336221f 100644
> > --- a/mm/slab.c
> > +++ b/mm/slab.c
> > @@ -3222,9 +3222,10 @@ slab_alloc_node(struct kmem_cache *cachep, gfp_t flags, int nodeid,
> >         unsigned long save_flags;
> >         void *ptr;
> >         int slab_node = numa_mem_id();
> > +       struct obj_cgroup *objcg = NULL;
> >
> >         flags &= gfp_allowed_mask;
> > -       cachep = slab_pre_alloc_hook(cachep, flags);
> > +       cachep = slab_pre_alloc_hook(cachep, &objcg, 1, flags);
> >         if (unlikely(!cachep))
> >                 return NULL;
> >
> > @@ -3260,7 +3261,7 @@ slab_alloc_node(struct kmem_cache *cachep, gfp_t flags, int nodeid,
> >         if (unlikely(slab_want_init_on_alloc(flags, cachep)) && ptr)
> >                 memset(ptr, 0, cachep->object_size);
> >
> > -       slab_post_alloc_hook(cachep, flags, 1, &ptr);
> > +       slab_post_alloc_hook(cachep, objcg, flags, 1, &ptr);
> >         return ptr;
> >  }
> >
> > @@ -3301,9 +3302,10 @@ slab_alloc(struct kmem_cache *cachep, gfp_t flags, unsigned long caller)
> >  {
> >         unsigned long save_flags;
> >         void *objp;
> > +       struct obj_cgroup *objcg = NULL;
> >
> >         flags &= gfp_allowed_mask;
> > -       cachep = slab_pre_alloc_hook(cachep, flags);
> > +       cachep = slab_pre_alloc_hook(cachep, &objcg, 1, flags);
> >         if (unlikely(!cachep))
> >                 return NULL;
> >
> > @@ -3317,7 +3319,7 @@ slab_alloc(struct kmem_cache *cachep, gfp_t flags, unsigned long caller)
> >         if (unlikely(slab_want_init_on_alloc(flags, cachep)) && objp)
> >                 memset(objp, 0, cachep->object_size);
> >
> > -       slab_post_alloc_hook(cachep, flags, 1, &objp);
> > +       slab_post_alloc_hook(cachep, objcg, flags, 1, &objp);
> >         return objp;
> >  }
> >
> > @@ -3443,6 +3445,7 @@ void ___cache_free(struct kmem_cache *cachep, void *objp,
> >                 memset(objp, 0, cachep->object_size);
> >         kmemleak_free_recursive(objp, cachep->flags);
> >         objp = cache_free_debugcheck(cachep, objp, caller);
> > +       memcg_slab_free_hook(cachep, virt_to_head_page(objp), objp);
> >
> >         /*
> >          * Skip calling cache_free_alien() when the platform is not numa.
> > @@ -3508,8 +3511,9 @@ int kmem_cache_alloc_bulk(struct kmem_cache *s, gfp_t flags, size_t size,
> >                           void **p)
> >  {
> >         size_t i;
> > +       struct obj_cgroup *objcg = NULL;
> >
> > -       s = slab_pre_alloc_hook(s, flags);
> > +       s = slab_pre_alloc_hook(s, &objcg, size, flags);
> >         if (!s)
> >                 return 0;
> >
> > @@ -3532,13 +3536,13 @@ int kmem_cache_alloc_bulk(struct kmem_cache *s, gfp_t flags, size_t size,
> >                 for (i = 0; i < size; i++)
> >                         memset(p[i], 0, s->object_size);
> >
> > -       slab_post_alloc_hook(s, flags, size, p);
> > +       slab_post_alloc_hook(s, objcg, flags, size, p);
> >         /* FIXME: Trace call missing. Christoph would like a bulk variant */
> >         return size;
> >  error:
> >         local_irq_enable();
> >         cache_alloc_debugcheck_after_bulk(s, flags, i, p, _RET_IP_);
> > -       slab_post_alloc_hook(s, flags, i, p);
> > +       slab_post_alloc_hook(s, objcg, flags, i, p);
> >         __kmem_cache_free_bulk(s, i, p);
> >         return 0;
> >  }
> > diff --git a/mm/slab.h b/mm/slab.h
> > index 7d175c2f1a61..c37a50f26e41 100644
> > --- a/mm/slab.h
> > +++ b/mm/slab.h
> > @@ -469,6 +469,41 @@ static inline void memcg_free_page_obj_cgroups(struct page *page)
> >         page->obj_cgroups = NULL;
> >  }
> >
> > +static inline void memcg_slab_post_alloc_hook(struct kmem_cache *s,
> > +                                             struct obj_cgroup *objcg,
> > +                                             size_t size, void **p)
> > +{
> > +       struct page *page;
> > +       unsigned long off;
> > +       size_t i;
> > +
> > +       for (i = 0; i < size; i++) {
> > +               if (likely(p[i])) {
> > +                       page = virt_to_head_page(p[i]);
> > +                       off = obj_to_index(s, page, p[i]);
> > +                       obj_cgroup_get(objcg);
> > +                       page_obj_cgroups(page)[off] = objcg;
> > +               }
> > +       }
> > +       obj_cgroup_put(objcg);
> > +       memcg_kmem_put_cache(s);
> > +}
> > +
> > +static inline void memcg_slab_free_hook(struct kmem_cache *s, struct page *page,
> > +                                       void *p)
> > +{
> > +       struct obj_cgroup *objcg;
> > +       unsigned int off;
> > +
> > +       if (!memcg_kmem_enabled() || is_root_cache(s))
> > +               return;
> > +
> > +       off = obj_to_index(s, page, p);
> > +       objcg = page_obj_cgroups(page)[off];
> > +       page_obj_cgroups(page)[off] = NULL;
> > +       obj_cgroup_put(objcg);
> > +}
> > +
> >  extern void slab_init_memcg_params(struct kmem_cache *);
> >  extern void memcg_link_cache(struct kmem_cache *s, struct mem_cgroup *memcg);
> >
> > @@ -528,6 +563,17 @@ static inline void memcg_free_page_obj_cgroups(struct page *page)
> >  {
> >  }
> >
> > +static inline void memcg_slab_post_alloc_hook(struct kmem_cache *s,
> > +                                             struct obj_cgroup *objcg,
> > +                                             size_t size, void **p)
> > +{
> > +}
> > +
> > +static inline void memcg_slab_free_hook(struct kmem_cache *s, struct page *page,
> > +                                       void *p)
> > +{
> > +}
> > +
> >  static inline void slab_init_memcg_params(struct kmem_cache *s)
> >  {
> >  }
> > @@ -630,7 +676,8 @@ static inline size_t slab_ksize(const struct kmem_cache *s)
> >  }
> >
> >  static inline struct kmem_cache *slab_pre_alloc_hook(struct kmem_cache *s,
> > -                                                    gfp_t flags)
> > +                                                    struct obj_cgroup **objcgp,
> > +                                                    size_t size, gfp_t flags)
> >  {
> >         flags &= gfp_allowed_mask;
> >
> > @@ -644,13 +691,14 @@ static inline struct kmem_cache *slab_pre_alloc_hook(struct kmem_cache *s,
> >
> >         if (memcg_kmem_enabled() &&
> >             ((flags & __GFP_ACCOUNT) || (s->flags & SLAB_ACCOUNT)))
> > -               return memcg_kmem_get_cache(s);
> > +               return memcg_kmem_get_cache(s, objcgp);
> >
> >         return s;
> >  }
> >
> > -static inline void slab_post_alloc_hook(struct kmem_cache *s, gfp_t flags,
> > -                                       size_t size, void **p)
> > +static inline void slab_post_alloc_hook(struct kmem_cache *s,
> > +                                       struct obj_cgroup *objcg,
> > +                                       gfp_t flags, size_t size, void **p)
> >  {
> >         size_t i;
> >
> > @@ -662,8 +710,8 @@ static inline void slab_post_alloc_hook(struct kmem_cache *s, gfp_t flags,
> >                                          s->flags, flags);
> >         }
> >
> > -       if (memcg_kmem_enabled())
> > -               memcg_kmem_put_cache(s);
> > +       if (memcg_kmem_enabled() && !is_root_cache(s))
> > +               memcg_slab_post_alloc_hook(s, objcg, size, p);
> >  }
> >
> >  #ifndef CONFIG_SLOB
> > diff --git a/mm/slub.c b/mm/slub.c
> > index aa8d18824e62..25810980a26c 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -2821,8 +2821,9 @@ static __always_inline void *slab_alloc_node(struct kmem_cache *s,
> >         struct kmem_cache_cpu *c;
> >         struct page *page;
> >         unsigned long tid;
> > +       struct obj_cgroup *objcg = NULL;
> >
> > -       s = slab_pre_alloc_hook(s, gfpflags);
> > +       s = slab_pre_alloc_hook(s, &objcg, 1, gfpflags);
> >         if (!s)
> >                 return NULL;
> >  redo:
> > @@ -2898,7 +2899,7 @@ static __always_inline void *slab_alloc_node(struct kmem_cache *s,
> >         if (unlikely(slab_want_init_on_alloc(gfpflags, s)) && object)
> >                 memset(object, 0, s->object_size);
> >
> > -       slab_post_alloc_hook(s, gfpflags, 1, &object);
> > +       slab_post_alloc_hook(s, objcg, gfpflags, 1, &object);
> >
> >         return object;
> >  }
> > @@ -3103,6 +3104,8 @@ static __always_inline void do_slab_free(struct kmem_cache *s,
> >         void *tail_obj = tail ? : head;
> >         struct kmem_cache_cpu *c;
> >         unsigned long tid;
> > +
> > +       memcg_slab_free_hook(s, page, head);
> >  redo:
> >         /*
> >          * Determine the currently cpus per cpu slab.
> > @@ -3282,9 +3285,10 @@ int kmem_cache_alloc_bulk(struct kmem_cache *s, gfp_t flags, size_t size,
> >  {
> >         struct kmem_cache_cpu *c;
> >         int i;
> > +       struct obj_cgroup *objcg = NULL;
> >
> >         /* memcg and kmem_cache debug support */
> > -       s = slab_pre_alloc_hook(s, flags);
> > +       s = slab_pre_alloc_hook(s, &objcg, size, flags);
> >         if (unlikely(!s))
> >                 return false;
> >         /*
> > @@ -3338,11 +3342,11 @@ int kmem_cache_alloc_bulk(struct kmem_cache *s, gfp_t flags, size_t size,
> >         }
> >
> >         /* memcg and kmem_cache debug support */
> > -       slab_post_alloc_hook(s, flags, size, p);
> > +       slab_post_alloc_hook(s, objcg, flags, size, p);
> >         return i;
> >  error:
> >         local_irq_enable();
> > -       slab_post_alloc_hook(s, flags, i, p);
> > +       slab_post_alloc_hook(s, objcg, flags, i, p);
> >         __kmem_cache_free_bulk(s, i, p);
> >         return 0;
> >  }
> >
> 
> I am not sure if this is the related patch or not that is causing
> mips architecture build failure on linux -next.

Hello, Naresh!

Thank you for the report, interesting...
There is nothing arch-specific in the code, so there must be something
compiler-dependent. My wild guess is that the problem is caused by a memory
allocation from the memcg_slab_post_alloc_hook(), but it's added by a later
patch in the series. So if it really fails at this patch, there must be something
different. I'll try to reproduce it, but I have to install the MIPS toolchain first,
so it might take some time. If it creates some troubles, can you, please, check
if s/__always_inline/inline helps?

Thanks!

> 
> make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j16 ARCH=mips
> CROSS_COMPILE=mips-linux-gnu- HOSTCC=gcc CC="sccache
> mips-linux-gnu-gcc" O=build
> #
> ../mm/slub.c: In function ‘slab_alloc.constprop’:
> ../mm/slub.c:2897:30: error: inlining failed in call to always_inline
> ‘slab_alloc.constprop’: recursive inlining
>  2897 | static __always_inline void *slab_alloc(struct kmem_cache *s,
>       |                              ^~~~~~~~~~
> ../mm/slub.c:2905:14: note: called from here
>  2905 |  void *ret = slab_alloc(s, gfpflags, _RET_IP_);
>       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../mm/slub.c: In function ‘sysfs_slab_alias’:
> ../mm/slub.c:2897:30: error: inlining failed in call to always_inline
> ‘slab_alloc.constprop’: recursive inlining
>  2897 | static __always_inline void *slab_alloc(struct kmem_cache *s,
>       |                              ^~~~~~~~~~
> ../mm/slub.c:2905:14: note: called from here
>  2905 |  void *ret = slab_alloc(s, gfpflags, _RET_IP_);
>       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../mm/slub.c: In function ‘sysfs_slab_add’:
> ../mm/slub.c:2897:30: error: inlining failed in call to always_inline
> ‘slab_alloc.constprop’: recursive inlining
>  2897 | static __always_inline void *slab_alloc(struct kmem_cache *s,
>       |                              ^~~~~~~~~~
> ../mm/slub.c:2905:14: note: called from here
>  2905 |  void *ret = slab_alloc(s, gfpflags, _RET_IP_);
>       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> Full build log link,
> https://urldefense.proofpoint.com/v2/url?u=https-3A__builds.tuxbuild.com_jBgeEp1SD-2DbUldWES782yQ_build.log&d=DwIFaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=jJYgtDM7QT-W-Fz_d29HYQ&m=XO4W3q0FbuSIPvvA7_av_jFzLvJw7jfRpBhtUGJfpKE&s=tlrwIrPSvEYT8QV4wnWxOnXQQMA8EYeYS-4O-BxVLOA&e= 
> 
> -- 
> Linaro LKFT
> https://urldefense.proofpoint.com/v2/url?u=https-3A__lkft.linaro.org&d=DwIFaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=jJYgtDM7QT-W-Fz_d29HYQ&m=XO4W3q0FbuSIPvvA7_av_jFzLvJw7jfRpBhtUGJfpKE&s=WFK6dW0eWT7ZY1HBBJeLSUgOxE2J11TOhbqdnCIdvCE&e= 
